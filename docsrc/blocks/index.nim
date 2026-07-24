import nimib, nimibook

nbInit(theme = useNimibook)

nbText: hlMd"""
## Blocks
This section lists and documents all blocks that are available in Nimibex. 
To import a block you have to explicitly import its submodule.
We have deliberately chosen to not provide a way to import all modules because
it would pollute the Nimib renderer and could cause unexpected behavior. This is the correct way to import the chat bubble block:
"""

nbCode:
  import nimibex / chat_bubbles

nbSave()