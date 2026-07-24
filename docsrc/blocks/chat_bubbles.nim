import nimib, nimibook, nimibex / [chat_bubbles]

nbInit(theme = useNimibook)

nbText: "## Chat Bubbles"

nbText: "### Demo"

let characterLeft = newChatBubbleCharacter(left=true, name="Reader")
let characterRight = newChatBubbleCharacter(left=false, name="Teacher", borderColor=colSpringGreen)#, image="https://www.svgrepo.com/show/340058/content-delivery-network.svg")
let characterRight2 = newChatBubbleCharacter(left=false, name="Teacher's assistant", borderColor=colPink)

characterLeft.chat("Hi there!")
characterLeft.chat("This is a **chat bubble**!")
characterRight.chat("Hi, I'm also here!")
characterRight.chat("And I can show code snippets: `z = x + y`")

nbText: "Each chat bubble is its own block, so you can place them wherever you like!"

characterLeft.chat("Cool! B-)")

nbText: "### Usage"


nbSave()