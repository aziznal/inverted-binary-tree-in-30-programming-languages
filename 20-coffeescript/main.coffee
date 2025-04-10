createNode = (content, left = null, right = null) ->
  content: content
  left: left
  right: right

getTraversal = (node) ->
  leftResult = if node.left? then (getTraversal node.left) else []
  rightResult = if node.right? then (getTraversal node.right) else []

  leftResult .concat [node.content] .concat rightResult

reverseTree = (node) ->
  reversedLeft = if node.left? then reverseTree(node.left) else null
  reversedRight = if node.right? then reverseTree(node.right) else null

  createNode(node.content, reversedRight, reversedLeft)

printTraversal = (traversal) ->
  console.log traversal.join(", ") 

node1 = createNode "4"
node2 = createNode "2"
node3 = createNode "5"
node4 = createNode "1"
node5 = createNode "3"

node1.left = node2
node1.right = node3
node2.left = node4
node2.right = node5

printTraversal getTraversal node1

printTraversal getTraversal reverseTree node1

