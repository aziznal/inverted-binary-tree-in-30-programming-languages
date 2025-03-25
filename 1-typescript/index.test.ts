import { expect, test } from "bun:test";
import { getTreeTraversal, reverseTree, type Node } from ".";

test("Binary tree inversion", () => {
  const node1: Node = {
    content: "4",
  };
  const node2: Node = {
    content: "2",
  };
  const node3: Node = {
    content: "5",
  };
  const node4: Node = {
    content: "1",
  };
  const node5: Node = {
    content: "3",
  };

  node1.left = node2;
  node1.right = node3;
  node2.left = node4;
  node2.right = node5;

  expect(getTreeTraversal(node1)).toStrictEqual(["1", "2", "3", "4", "5"]);

  reverseTree(node1);

  expect(getTreeTraversal(node1)).toStrictEqual(["5", "4", "3", "2", "1"]);
});
