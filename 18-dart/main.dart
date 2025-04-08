class Node {
  String content;
  Node? left;
  Node? right;

  Node(this.content, this.left, this.right);
}

Node createNode(String content, { Node? left = null, Node? right = null }) {
  return new Node(content, left, right);
}

List<String> getTraversal(Node node) {
  final List<String> currentNodeContent = [node.content];

  List<String> leftTraversal = switch (node.left) {
    Node() => getTraversal(node.left!),
    _ => [],
  };

  List<String> rightTraversal = switch (node.right) {
    Node() => getTraversal(node.right!),
    _ => [],
  };

  return leftTraversal + currentNodeContent + rightTraversal;
}

Node reverseTree(Node node) {
  Node? reversedLeft = switch (node.left) {
    Node() => reverseTree(node.left!),
    _ => null,
  };

  Node? reversedRight = switch (node.right) {
    Node() => reverseTree(node.right!),
    _ => null,
  };

  return createNode(node.content, left: reversedRight, right: reversedLeft);
}

void main() {
  Node node1 = createNode("4");
  Node node2 = createNode("2");
  Node node3 = createNode("5");
  Node node4 = createNode("1");
  Node node5 = createNode("3");

  node1.left = node2;
  node1.right = node3;
  node2.left = node4;
  node2.right = node5;

  print(getTraversal(node1));

  print(getTraversal(reverseTree(node1)));
}

