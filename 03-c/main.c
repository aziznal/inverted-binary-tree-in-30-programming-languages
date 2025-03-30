#include <stdio.h>

typedef struct Node {
  char* content;
  struct Node *left;
  struct Node *right;
} Node;

void traverse(Node* node) { 
  if (!node) return;

  traverse(node->left);

  printf(node->content);
  printf(", ");

  traverse(node->right);
}

void reverse_tree(Node* node) {
  if (node->right) reverse_tree(node->right);
  if (node->left) reverse_tree(node->left);

  Node* node_left = node->left;
  Node* node_right = node->right;

  node->left = node_right;
  node->right = node_left;
}

int main() {
  Node node1 = { "4" };
  Node node2 = { "2" };
  Node node3 = { "5" };
  Node node4 = { "1" };
  Node node5 = { "3" };

  node2.left = &node4;
  node2.right = &node5;
  node1.left = &node2;
  node1.right = &node3;

  traverse(&node1);

  reverse_tree(&node1);

  printf("\n");
  traverse(&node1);

  printf("\n");

  return 0;
}

