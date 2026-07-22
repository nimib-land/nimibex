import std / [colors, strformat]
import nimib

export colors

func washColor*(c: Color): Color =
  ## Increase brightness and move towards white (less saturation)
  discard

discard hlHtml"""
<style>
.nimib-chat-bubble {
  display: flex;
  flex-direction: row; /* image first */
  flex-direction: row-reverse; /* image last */
  align-content: flex-start;
  align-items: flex-start;
  gap: .5rem;
}

/* add styling to the parahraph as well*/ 
p {
  border-color: grey;
  background-color: darken(grey, 70%);
  border-width: 1px;
  margin-top: 0;
  margin-bottom: 0;
  max-width: 32rem;
  border-radius: .75rem;
  padding-top: .5rem;
  padding-bottom: .5rem;
  padding-left: .75rem;
  padding-right: .75rem;
}
</style>

<div class="nimib-chat-bubble">
  <img src="character.svg"/>
  <p>Content</p>
</div>
"""

type
  ChatBubbleCharacter* = object
    name*: string
    image*: string
    left*: bool
    borderColor*: Color # TODO: replace with color object
    backgroundColor*: Color

# can this be run in an init template instead?
# Or is it enough that you have to import each block separatly. Then you don't get any unneccery blocks!

# TODO: neon colors? animation?

newNbBlock(NbChatBubble):
  text: string
  name: string
  image: string
  left: bool
  borderColor: Color
  backgroundColor: Color
  toHtml:
    let text = markdownToHtml(blk.text)
    let flexDirection = if blk.left: "row" else: "row-reverse"
    let align = if blk.left: "left" else: "right"
    let wrapperStyles = &"display: flex; align-content: flex-start; align-items: center; gap: .5rem; flex-direction: {flexDirection}; margin-top: 0.5rem; margin-bottom: 0.5rem;"
    let contentStyles = &"border-color: {blk.borderColor};  background-color: {blk.backgroundColor};  border-width: 1px;  margin-top: 0;  margin-bottom: 0;  max-width: 32rem;  border-radius: .75rem;  padding-top: 0; padding-bottom: 0; padding-left: .75rem; padding-right: .75rem;"
    withNewlines:
      hlHtmlF"""<div class="nimib-chat-bubble" style="{wrapperStyles}">"""
      if blk.image.len > 0:
        hlHtmlF"""<img src="{blk.image}" style="height: 32px; width: auto; image-fit: contain;"/>"""
      hlHtml""" <div style="display:flex; flex-direction: column;">"""
      if blk.name.len > 0:
        hlHtmlF"""<span style="text-align: {align}"><i>{blk.name}</i></span>"""
      hlHtmlF"""  <div style="{contentStyles}">"""
      text
      "   </div>"
      " </div>"
      "</div>"

# Two overrides: manual and from a character
proc chatBubble*(nb: var Nb, text: string, name: string, image: string, left: bool, borderColor: Color, backgroundColor: Color) =
  let blk = newNbChatBubble(text=text, name=name, image=image, left=left, borderColor=borderColor, backgroundColor = backgroundColor)
  nb.add blk

template chat*(character: ChatBubbleCharacter, message: string) =
  nb.chatBubble(text=message, name=character.name, image=character.image, left=character.left, borderColor=character.borderColor, backgroundColor=character.backgroundColor)

func createChatBubbleCharacter*(left: bool, borderColor: Color = colLightBlue, backgroundColor = borderColor.intensity(1.2), name = "", image = ""): ChatBubbleCharacter =
  ChatBubbleCharacter(left: left, borderColor: borderColor, backgroundColor: backgroundColor, name: name, image: image)