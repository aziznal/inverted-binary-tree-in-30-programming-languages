export type Node = {
  content: string;
  left?: Node;
  right?: Node;
};

export function getTreeTraversal(node: Node) {
  const traversal = [] as string[];

  const print = (node: Node) => {
    if (node.left) {
      print(node.left);
    }

    traversal.push(node.content);

    if (node.right) {
      print(node.right);
    }
  };

  print(node);

  return traversal;
}

export function reverseTree(node: Node) {
  if (node.left) reverseTree(node.left);
  if (node.right) reverseTree(node.right);

  const nodeRight = node.right;
  const nodeLeft = node.left;

  node.left = nodeRight;
  node.right = nodeLeft;
}
