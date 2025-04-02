import std.stdio;
import std.conv : text;
import std.algorithm.mutation : swap;

struct Node {
  string content;
  Node* left;
  Node* right;
}

Node createNode(string content) {
  return Node (content, null, null);
}

string[] getTraversal(Node* node) {
  string[] traversal = [];

  void traverse(Node* node) {
    if (node.left != null) {
      traverse(node.left);
    }

    // wtf is this syntax
    traversal ~= node.content;

    if (node.right != null) {
      traverse(node.right);
    }
  }

  traverse(node);

  return traversal;
}

void reverseTree(Node* node) {
  if (node.left != null) {
    reverseTree(node.left);
  }

  if (node.right != null) {
    reverseTree(node.right);
  }

  swap(node.left, node.right);
}

void printTraversal(string[]* traversal) {
  foreach(item; *traversal) {
    write(item);
    write(", ");
  }

  writeln();
}

void main() {
  auto node1 = createNode("4");
  auto node2 = createNode("2");
  auto node3 = createNode("5");
  auto node4 = createNode("1");
  auto node5 = createNode("3");

  node1.left = &node2;
  node1.right = &node3;
  node2.left = &node4;
  node2.right = &node5;

  auto traversal = getTraversal(&node1);

  printTraversal(&traversal);

  reverseTree(&node1);

  auto reverseTraversal = getTraversal(&node1);

  printTraversal(&reverseTraversal);
}

