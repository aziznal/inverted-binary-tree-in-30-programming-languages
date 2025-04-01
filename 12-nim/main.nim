type
  Node = ref object
    content: string
    left, right: Node

proc createNode(content: string): Node =
  return Node(content: content, left: nil, right: nil)

proc getTraversal(node: Node): seq[string] =
  var traversal: seq[string] = @[]

  proc traverse(node: Node): void =
    if node.left != nil:
      traverse(node.left)

    traversal.add(node.content)

    if node.right != nil:
      traverse(node.right)
  
  traverse(node)

  return traversal


proc printTraversal(traversal: seq[string]): void =
  for item in traversal:
    stdout.write item, ", "
  
  echo()

proc reverseTree(node: Node): void =
  if node.left != nil:
    reverseTree(node.left)

  if node.right != nil:
    reverseTree(node.right)

  let 
    nodeLeft = node.left
    nodeRight = node.right

  node.left = nodeRight
  node.right = nodeLeft

var node1 = createNode("4")
var node2 = createNode("2")
var node3 = createNode("5")
var node4 = createNode("1")
var node5 = createNode("3")

node1.left = node2
node1.right = node3
node2.left = node4
node2.right = node5

printTraversal(getTraversal(node1))

reverseTree(node1)

printTraversal(getTraversal(node1))
