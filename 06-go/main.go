package main

import "fmt"

type Node struct {
	content string
	left    *Node
	right   *Node
}

func getTraversal(node *Node) []string {
	var traversal = []string{}

	// recursive closure must be declared this way before usage
	var traverse func(node *Node)

	traverse = func(node *Node) {
		if node.left != nil {
			traverse(node.left)
		}

		traversal = append(traversal, node.content)

		if node.right != nil {
			traverse(node.right)
		}
	}

	traverse(node)

	return traversal
}

func reverseTree(node *Node) {
	if node.left != nil {
		reverseTree(node.left)
	}

	if node.right != nil {
		reverseTree(node.right)
	}

	node.left, node.right = node.right, node.left
}

func main() {
	var node1 = Node{"4", nil, nil}
	var node2 = Node{"2", nil, nil}
	var node3 = Node{"5", nil, nil}
	var node4 = Node{"1", nil, nil}
	var node5 = Node{"3", nil, nil}

	node1.left = &node2
	node1.right = &node3
	node2.left = &node4
	node2.right = &node5

	fmt.Println(getTraversal(&node1))

	reverseTree(&node1)

	fmt.Println(getTraversal(&node1))
}
