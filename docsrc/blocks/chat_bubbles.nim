import nimib, nimibook, nimibex / [chat_bubbles]

nbInit(theme = useNimibook)

nbText: "# Chat Bubbles"

nbText: "## Example"

let exampleCharacterLeft = newChatBubbleCharacter(left=true, name="Demo user #1", image="https://raw.githubusercontent.com/nimib-land/assets/refs/heads/main/nimib_logo_white_bg_4k.png")
let exampleCharacterRight = newChatBubbleCharacter(left=false, name="Demo user #2", color=parseHtmlColor("springgreen"))

exampleCharacterLeft.chat("Hi there!")
exampleCharacterLeft.chat("This is a **chat bubble**!")
exampleCharacterRight.chat("Hi, I'm also here!")
exampleCharacterRight.chat: hlMd"""
And I can show code snippets:
```py
z = x + y * 2
```
"""

nbText: "Each chat bubble is its own block, so you can place them wherever you like!"

exampleCharacterLeft.chat("Cool! B-)")

nbText: hlMd"""
## Usage
To create a chat bubble you first have to create a `ChatBubbleCharacter` which will contain the
information on how to render chat bubble (color, left/right, username, icon):
"""

nbCode:
  let leftCharacter = newChatBubbleCharacter()

nbText: hlMd"""
Once we have a character we can create a chat bubble using the `chat` method:
"""

nbCode:
  leftCharacter.chat("This is the left chat person speaking!")

nbText: hlMd"""
It's not harder than that! There are multiple parameters you can assign to a `ChatBubbleCharacter`:
"""

nbCode:
  let rightCharacter = newChatBubbleCharacter(
    left = false, # put it on the right side
    color = parseHtmlColor("springgreen"), # set the color (border)
    backgroundColor = parseHtmlColor("beige"), # set background color
    textColor = parseHtmlColor("red"), # set text color
    name = "Cool username", # set username that will be shown above chat bubbles
    image = "https://raw.githubusercontent.com/nimib-land/assets/refs/heads/main/nimib_logo_white_bg_4k.png" # set the icon besides the chat bubbles
  )

  rightCharacter.chat("This is the right person speaking!")

nbText: hlMd"""
The colors objects are from [chroma](https://github.com/treeform/chroma). 
The `color` is parameter can mean two things:
- If you also pass `backgroundColor`, `color` will just set the border color of the chat bubble.
- If you **don't** pass `backgroundColor`, `color` will be used for the border and a more opaque version of it will be used as the background color.
So unless you dislike the automatic background color, you only have to pass the `color` argument.

Now we can have a chat between them:
"""

nbCode:
  leftCharacter.chat("How are you?")
  rightCharacter.chat("I'm fine thanks, how are you?")
  leftCharacter.chat("Great to hear! I'm also doing well!")
  rightCharacter.chat("Have to go, smell you later!")
  leftCharacter.chat("Bye!")

nbText: hlMd"""
You can create as many characters as you like and use and mix them however you like. 

Some example use-cases:
- Use it to ask rhetoric questions on the user's behalf
- Use it to tell a story
"""

nbSave()