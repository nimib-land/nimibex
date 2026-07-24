import std / [colors, strformat, sugar]
import nimib

export colors

func washColor*(c: Color, factor: float = 0.7): Color =
  ## Increase brightness and move towards white (less saturation)
  c.mix(colWhite, (x: int, y: int) => int((1-factor) * x.float + factor * y.float))

type
  ChatBubbleCharacter* = object
    name*: string
    image*: string
    left*: bool
    borderColor*: Color
    backgroundColor*: Color
    textColor*: Color

newNbBlock(NbChatBubble):
  text: string
  name: string
  image: string
  left: bool
  borderColor: Color
  backgroundColor: Color
  textColor: Color
  toHtml:
    let text = markdownToHtml(blk.text)
    let flexDirection = if blk.left: "row" else: "row-reverse"
    let align = if blk.left: "left" else: "right"
    let wrapperStyles = &"display: flex; align-content: flex-start; align-items: center; gap: .5rem; flex-direction: {flexDirection}; margin-bottom: 0.5rem;"
    let contentStyles = &"border: 1px solid {blk.borderColor}; background-color: {blk.backgroundColor}; color: {blk.textColor}; margin-top: 0;  margin-bottom: 0;  max-width: 32rem;  border-radius: .75rem;  padding-top: 0; padding-bottom: 0; padding-left: .75rem; padding-right: .75rem;"
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
proc chatBubble*(nb: var Nb, text: string, name: string, image: string, left: bool, borderColor: Color, backgroundColor: Color, textColor: Color) =
  let blk = newNbChatBubble(text=text, name=name, image=image, left=left, borderColor=borderColor, backgroundColor = backgroundColor, textColor = textColor)
  nb.add blk

template chat*(character: ChatBubbleCharacter, message: string) =
  nb.chatBubble(text=message, name=character.name, image=character.image, left=character.left, borderColor=character.borderColor, backgroundColor=character.backgroundColor, textColor=character.textColor)

func newChatBubbleCharacter*(left: bool, borderColor: Color = colLightBlue, backgroundColor = borderColor.washColor, textColor = colBlack, name = "", image = ""): ChatBubbleCharacter =
  ChatBubbleCharacter(left: left, borderColor: borderColor, backgroundColor: backgroundColor, textColor: textColor, name: name, image: image)