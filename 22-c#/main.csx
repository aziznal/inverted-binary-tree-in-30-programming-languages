public class Node {
  public string content;
  public Node left;
  public Node right;

  public Node(string content, Node left, Node right) {
    this.content = content;
    this.left = left;
    this.right = right;
  }
}

Node createNode(String content, Node left = null, Node right = null) {
  return new Node(content, left, right);
}

List<string> getTraversal(Node node) {
  List<string> currentNodeContent = new List<string> { node.content };
  List<string> leftResult = new List<string>();
  List<string> rightResult = new List<string>();

  if (node.left != null) {
    leftResult = getTraversal(node.left);
  }

  if (node.right != null) {
    rightResult = getTraversal(node.right);
  }

  return leftResult.Concat(currentNodeContent).Concat(rightResult).ToList();
}

Node reverseTree(Node node) {
  Node reversedLeft = null;
  Node reversedRight = null;

  if (node.left != null) {
    reversedLeft = reverseTree(node.left);
  }

  if (node.right != null) {
    reversedRight = reverseTree(node.right);
  }

  return createNode(node.content, reversedRight, reversedLeft);
}

Node node1 = createNode("4");
Node node2 = createNode("2");
Node node3 = createNode("5");
Node node4 = createNode("1");
Node node5 = createNode("3");

node1.left = node2;
node1.right = node3;
node2.left = node4;
node2.right = node5;

Console.WriteLine(
  String.Join(", ", getTraversal(node1))
);

var reversedTree = reverseTree(node1);
Console.WriteLine(
    String.Join(", ", getTraversal(reversedTree))
);

