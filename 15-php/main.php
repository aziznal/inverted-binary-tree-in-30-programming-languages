<?php
class Node {
  public $content;
  public $left;
  public $right;

  function __construct($content, $left, $right) {
    $this->content = $content;
    $this->left = $left;
    $this->right = $right;
  }
}

function create_node($content, $left = NULL, $right = NULL) {
  return new Node($content, $left, $right);
}

function traverse($node, &$traversal) {
  if ($node->left != NULL) {
    traverse($node->left, $traversal);
  }

  array_push($traversal, $node->content);

  if ($node->right != NULL) {
    traverse($node->right, $traversal);
  }
}

function get_traversal($node) {
  $traversal = array();

  traverse($node, $traversal);

  return $traversal;
}

function reverse_tree(&$node) {
  if ($node->left != NULL) {
    reverse_tree($node->left);
  }

  if ($node->right != NULL) {
    reverse_tree($node->right);
  }

  $nodeLeft = $node->left;
  $nodeRight = $node->right;

  $node->left = $nodeRight; 
  $node->right = $nodeLeft;
}

function print_traversal($traversal) {
  foreach ($traversal as $entry) {
    echo "$entry, ";
  }
}

$node1 = create_node("4");
$node2 = create_node("2");
$node3 = create_node("5");
$node4 = create_node("1");
$node5 = create_node("3");

$node1->left = $node2;
$node1->right = $node3;
$node2->left = $node4;
$node2->right = $node5;

print_traversal(get_traversal($node1));

reverse_tree($node1);

echo "\n";

print_traversal(get_traversal($node1));

echo "\n";
?>
