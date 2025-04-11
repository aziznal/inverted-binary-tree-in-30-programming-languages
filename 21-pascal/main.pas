type
  PNode = ^Node;

  Node = record
     content: string;  
     left, right: PNode;
  end;

  Traversal = array of string;

procedure getTraversal(nodePtr: PNode);
begin
  if nodePtr=nil then exit;

  getTraversal(nodePtr^.left);

  write(nodePtr^.content);
  write(', ');

  getTraversal(nodePtr^.right);
end;

procedure reverseTree(nodePtr: PNode);
var
  nodeLeft, nodeRight: PNode;
begin
  if nodePtr^.left <> nil then reverseTree(nodePtr^.left);
  if nodePtr^.right <> nil then reverseTree(nodePtr^.right);

  nodeLeft := nodePtr^.left;
  nodeRight := nodePtr^.right;

  nodePtr^.left := nodeRight;
  nodePtr^.right := nodeLeft;
end;

var
  node1, node2, node3, node4, node5: Node;

begin
  node1.content := '4';
  node2.content := '2';
  node3.content := '5';
  node4.content := '1';
  node5.content := '3';

  node1.left := @node2;
  node1.right := @node3;
  node2.left := @node4;
  node2.right := @node5;

  getTraversal(@node1);

  reverseTree(@node1);

  writeLn();

  getTraversal(@node1);

  writeln; // Add for newline after output
end.
