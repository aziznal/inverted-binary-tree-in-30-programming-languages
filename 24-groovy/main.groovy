class Node {
  String content;
  Node left;
  Node right;
}

def createNode(String content, Node left =  null, Node right = null) {
  def node = new Node();

  node.content = content;
  node.left = left;
  node.right = right;

  return node;
}

def getTraversal(Node node) {
  def nodeContent = [node.content];

  def leftResult = [];
  if (node.left != null) {
    leftResult = getTraversal(node.left);
  }

  def rightResult = [];
  if (node.right != null) {
    rightResult = getTraversal(node.right);
  }

  return leftResult + nodeContent + rightResult;
}

def reverseTree(Node node) {
  if (node == null) return null;

  def reversedLeft = reverseTree(node.left);
  def reversedRight = reverseTree(node.right);

  return createNode(node.content, reversedRight, reversedLeft);
}

def node1 = createNode("4");
def node2 = createNode("2");
def node3 = createNode("5");
def node4 = createNode("1");
def node5 = createNode("3");

node1.left = node2;
node1.right = node3;
node2.left = node4;
node2.right = node5;

println getTraversal(node1);

println getTraversal(reverseTree(node1));
