import nimib, nimibook, nimibex / [chat_bubbles]

nbInit(theme = useNimibook)

nbText: "## Chat Bubbles"

nbText: "### Example"

let characterLeft = newChatBubbleCharacter(left=true, name="Demo user #1")
let characterRight = newChatBubbleCharacter(left=false, name="Demo user #2", color=colSpringGreen)

characterLeft.chat("Hi there!")
characterLeft.chat("This is a **chat bubble**!")
characterRight.chat("Hi, I'm also here!")
characterRight.chat: hlMd"""
And I can show code snippets:
```py
z = x + y * 2
```
"""

nbText: "Each chat bubble is its own block, so you can place them wherever you like!"

characterLeft.chat("Cool! B-)")

nbText: hlMd"""
### Usage
To create a chat bubble you first have to create a `ChatBubbleCharacter` which will contain the information on how to render chat bubble (color, left/right, username, icon)
"""

# for raw calls, see the API documentation
nbSave()