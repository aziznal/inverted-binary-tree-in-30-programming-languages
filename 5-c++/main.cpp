#include <iostream>
#include <vector>

using namespace std;

typedef struct Node {
  string content;
  Node* left;
  Node* right;
} Node;

Node create_node(string content, Node* left = NULL, Node* right = NULL) {
  return Node { content, left, right };
}

/*
 * Does in-order traversal of implied tree starting from given `node`, adding each node contents to `traversal`.
 */
void traverse(Node* node, vector<string>* traversal) {
  if (node->left) {
    traverse(node->left, traversal);
  }

  traversal->push_back(node->content);

  if (node->right) {
    traverse(node->right, traversal);
  }
}

vector<string> get_traversal(Node* node) {
  vector<string> traversal;

  traverse(node, &traversal);

  return traversal;
}

void print_traversal(vector<string> traversal) {
  for(const string& i : traversal) 
    cout << i << ", ";

  cout << endl;
}

void reverse_tree(Node* node) {
  if (node->left) reverse_tree(node->left);
  if (node->right) reverse_tree(node->right);

  auto node_right = node->right;
  auto node_left = node->left;

  node->right = node_left;
  node->left = node_right;
}

int main() {
  Node node1 = create_node("4");
  Node node2 = create_node("2");
  Node node3 = create_node("5");
  Node node4 = create_node("1");
  Node node5 = create_node("3");

  node1.left = &node2;
  node1.right = &node3;
  node2.left = &node4;
  node2.right = &node5;

  vector<string> traversal = get_traversal(&node1);
  print_traversal(traversal);

  reverse_tree(&node1);

  vector<string> reverse_traversal = get_traversal(&node1);
  print_traversal(reverse_traversal);
  
  return 0;
}

