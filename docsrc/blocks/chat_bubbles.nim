import nimib, nimibook, nimibex / [chat_bubbles]

nbInit(theme = useNimibook)

nbText: "## Chat Bubbles"

let characterLeft = newChatBubbleCharacter(left=true, name="Reader")
let characterRight = newChatBubbleCharacter(left=false, name="Teacher", borderColor=colSpringGreen)#, image="https://www.svgrepo.com/show/340058/content-delivery-network.svg")
let characterRight2 = newChatBubbleCharacter(left=false, name="Teacher's assistant", borderColor=colPink)

characterLeft.chat("Hi there!")
characterRight.chat("Hi! How *are* **you** today?")
characterRight.chat("Another message")
characterRight2.chat("I'm also here!")
characterLeft.chat: hlMd"""
This is code:
```py
def add(a, b):
  return a + b
```
How was _that_?
"""

characterRight.chat("That is correct!")
characterRight.chat("Let's try again")
characterLeft.chat("Hurray! It works!")

nbSave()