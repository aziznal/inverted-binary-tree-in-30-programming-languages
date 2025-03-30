from typing import Self

class Node:
    def __init__(self, content: str, left: Self = None, right: Self = None):
        self.content = content
        self.left = left
        self.right = right
    
    def __str__(self):
        leftContent = "None" if self.left == None else self.left.content
        rightContent = "None" if self.right == None else self.right.content

        return f"content: {self.content}, left: {leftContent}, right: {rightContent}"


def create_node(content: str, left: Node = None, right: Node = None):
    return Node(content, left, right)

def get_traversal(node: Node):
    traversal = []

    def traverse(node: Node):
        if (node.left != None):
            traverse(node.left)

        traversal.append(node.content)

        if (node.right != None):
            traverse(node.right)

    traverse(node)

    return traversal 

def reverse_tree(node: Node):
    if node.left: reverse_tree(node.left);
    if node.right: reverse_tree(node.right);

    node.left, node.right = node.right, node.left;

if __name__ == "__main__":
    node1 = create_node("4")
    node2 = create_node("2")
    node3 = create_node("5")
    node4 = create_node("1")
    node5 = create_node("3")

    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;

    traversal = get_traversal(node1)

    assert traversal == ["1", "2", "3", "4", "5"]
    
    reverse_tree(node1)

    reverse_traversal = get_traversal(node1)

    assert reverse_traversal == ["5", "4", "3", "2", "1"]

    print(f"traversal: {traversal}")

    print(f"reverse traversal: {reverse_traversal}")

