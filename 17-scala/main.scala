class Node(
  val content: String,
  var left: Option[Node] = null,
  var right: Option[Node] = null 
) {}

def getTraversal(node: Node): List[String] = {
  (node.left match {
    case Some(nodeLeft) => getTraversal(nodeLeft)
    case _ => Nil
  })
  ++ List(node.content)
  ++ (node.right match {
    case Some(nodeRight) => getTraversal(nodeRight)
    case _ => Nil
  })
}

def reverseTree(node: Node): Node = {
  val reversedLeft = node.left match 
    case Some(nodeLeft) => reverseTree(nodeLeft)
    case _ => null

  val reversedRight = node.right match 
    case Some(nodeRight) => reverseTree(nodeRight)
    case _ => null 

  return Node(
    node.content,
    Option(reversedRight),
    Option(reversedLeft),
  )
}

@main def hello() =
  val node1 = Node("4")
  val node2 = Node("2")
  val node3 = Node("5")
  val node4 = Node("1")
  val node5 = Node("3")

  node1.left = Option(node2)
  node1.right = Option(node3)
  node2.left = Option(node4)
  node2.right = Option(node5)

  println(getTraversal(node1))
  
  println(getTraversal(reverseTree(node1)))
  
