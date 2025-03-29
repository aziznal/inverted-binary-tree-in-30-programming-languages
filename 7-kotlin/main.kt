data class Node (
    val content: String,
    var left: Node?,
    var right: Node?
) {}

fun createNode(content: String, left: Node? = null, right: Node? = null): Node {
    return Node(content, left, right)
}

fun getTraversal(node: Node): List<String> {
    val traversal: MutableList<String> = mutableListOf()

    fun traverse(node: Node) {
        node.left?.let { traverse(it) }

        traversal.add(node.content)

        node.right?.let { traverse(it) }
    }

    traverse(node)

    return traversal
}

fun reverseTree(node: Node) {
    node.left?.let { reverseTree(it) }
    node.right?.let { reverseTree(it) }

    val nodeLeft = node.left
    val nodeRight = node.right

    node.right = nodeLeft
    node.left = nodeRight
}

fun main() {
    val node1 = createNode("4")
    val node2 = createNode("2")
    val node3 = createNode("5")
    val node4 = createNode("1")
    val node5 = createNode("3")

    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5

    println("${getTraversal(node1)}")

    reverseTree(node1)

    println("${getTraversal(node1)}")
}
