import nimibook

var book = initBookWithToc:
  entry("Documentation", "index.nim", numbered = false)
  section("Blocks", "blocks/index.nim"):
    entry("Chat Bubbles", "chat_bubbles.nim")


nimibookCli(book)