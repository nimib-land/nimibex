import nimib, nimibook, nimibex / [chat_bubbles]

nbInit(theme = useNimibook)

nbText: "## Chat Bubbles"

nbText: "### Demo"

let characterLeft = newChatBubbleCharacter(left=true, name="Reader")
let characterRight = newChatBubbleCharacter(left=false, name="Teacher", borderColor=colSpringGreen)#, image="https://www.svgrepo.com/show/340058/content-delivery-network.svg")
let characterRight2 = newChatBubbleCharacter(left=false, name="Teacher's assistant", borderColor=colPink)

characterLeft.chat("Hi there!")
characterLeft.chat("This is a chat bubble!")


nbSave()