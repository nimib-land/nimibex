import std / [strformat, options]
import nimib
import chroma

export chroma

func washColor*(c: Color, factor: float = 0.2): Color =
  ## Decrease the opacity by the factor
  result = c
  result.a *= factor

type
  ChatBubbleCharacter* = object
    name*: string
    image*: string
    left*: bool
    color*: Color
    backgroundColor*: Color
    # Text color must be optional so we can use the text color of the theme by default
    textColor*: Option[Color]

newNbBlock(NbChatBubble):
  text: string
  name: string
  image: string
  left: bool
  color: Color
  backgroundColor: Color
  textColor: Option[Color]
  toHtml:
    let text = markdownToHtml(blk.text)
    let flexDirection = if blk.left: "row" else: "row-reverse"
    let align = if blk.left: "left" else: "right"
    let textColorStyle = if blk.textColor.isSome: &"color: {blk.textColor.get.toHtmlRgba};" else: ""
    let wrapperStyles = &"display: flex; align-content: flex-start; align-items: center; gap: .5rem; flex-direction: {flexDirection}; margin-bottom: 0.5rem;"
    let contentStyles = &"border: 1px solid {blk.color.toHtmlRgba}; background-color: {blk.backgroundColor.toHtmlRgba}; {textColorStyle} margin-top: 0;  margin-bottom: 0;  max-width: 32rem;  border-radius: .75rem;  padding-top: 0; padding-bottom: 0; padding-left: .75rem; padding-right: .75rem;"
    let imageStyles = "height: 32px; width: auto; image-fit: contain;"
    let columnStyles = "display:flex; flex-direction: column;"
    withNewlines:
      hlHtmlF"""<div class="nimib-chat-bubble" style="{wrapperStyles}">"""
      
      if blk.image.len > 0:
        hlHtmlF"""<img src="{blk.image}" style="{imageStyles}"/>"""
      
      hlHtmlF""" <div style="{columnStyles}">"""
      if blk.name.len > 0:
        hlHtmlF"""<span style="text-align: {align}"><i>{blk.name}</i></span>"""
      hlHtmlF"""  <div style="{contentStyles}">"""
      text
      "   </div>"
      " </div>"
      "</div>"

# Two overrides: manual and from a character
proc chatBubble*(nb: var Nb, text: string, name: string, image: string, left: bool, color: Color, backgroundColor: Color, textColor: Option[Color]) =
  let blk = newNbChatBubble(text=text, name=name, image=image, left=left, color=color, backgroundColor = backgroundColor, textColor = textColor)
  nb.add blk

template chat*(character: ChatBubbleCharacter, message: string) =
  nb.chatBubble(text=message, name=character.name, image=character.image, left=character.left, color=character.color, backgroundColor=character.backgroundColor, textColor=character.textColor)

func newChatBubbleCharacter*(left = true, color: Color = parseHtmlColor("lightskyblue"), backgroundColor = color.washColor, textColor: Option[Color] | Color = none(Color), name = "", image = ""): ChatBubbleCharacter =
  when type(textColor) is Color:
    let textColor = some(textColor)
  ChatBubbleCharacter(left: left, color: color, backgroundColor: backgroundColor, textColor: textColor, name: name, image: image)