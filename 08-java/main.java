import java.util.ArrayList;

class Main {
  public static void main(String[] args) {
    var node1 = new Node("4");
    var node2 = new Node("2");
    var node3 = new Node("5");
    var node4 = new Node("1");
    var node5 = new Node("3");

    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;

    Node.printTraversal(Node.getTraversal(node1));

    Node.reverseTree(node1);

    Node.printTraversal(Node.getTraversal(node1));
  }
}

class Node {
  String content;
  Node left = null;
  Node right = null;

  public Node(String content) {
    this.content = content;
  }

  static void traverse(Node node, ArrayList<String> traversal) {
      if (node.left != null) {
        traverse(node.left, traversal);
      }
  
      traversal.add(node.content);

      if (node.right != null) {
        traverse(node.right, traversal);
      }
  }

  public static ArrayList<String> getTraversal(Node node) {
    ArrayList<String> traversal = new ArrayList<String>();

    Node.traverse(node, traversal);

    return traversal;
  }

  public static void reverseTree(Node node) {
    if (node.left != null) Node.reverseTree(node.left);
    if (node.right != null) Node.reverseTree(node.right);

    var nodeLeft = node.left;
    var nodeRight = node.right;

    node.left = nodeRight;
    node.right = nodeLeft;
  }

  public static void printTraversal(ArrayList<String> traversal) {
    for (var item : traversal) {
      System.out.print(item);
      System.out.print(", ");
    }

    System.out.println("");
  }
}

