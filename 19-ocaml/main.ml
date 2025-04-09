type node = {
  content : string;
  left : node option;
  right : node option;
};;

let create_node content left right =
  { content = content; left = left; right = right };;

let rec get_traversal node = 
  let currentNodeContent = [node.content] in

  let leftResult = match node.left with 
    | None -> []
    | Some (nodeLeft) -> get_traversal nodeLeft
  in 

  let rightResult = match node.right with 
    | None -> []
    | Some (nodeRight) -> get_traversal nodeRight
  in 

  leftResult @ currentNodeContent @ rightResult;;

let rec reverse_tree node =
  let currentNodeContent = node.content in

  let reversedLeft = match node.left with
    | None -> None
    | Some (nodeLeft) -> Some(reverse_tree(nodeLeft))
  in

  let reversedRight = match node.right with
    | None -> None
    | Some (nodeRight) -> Some(reverse_tree(nodeRight)) 
  in

  create_node currentNodeContent reversedRight reversedLeft;;

let join_traversal traversal =
  String.concat ", " traversal;;

let node4 = create_node "1" None None;;
let node5 = create_node "3" None None;;
let node3 = create_node "5" None None;;
let node2 = create_node "2" (Some node4) (Some node5);;
let node1 = create_node "4" (Some node2) (Some node3);;

print_endline (join_traversal (get_traversal node1));;
print_endline (join_traversal (get_traversal (reverse_tree(node1))));;
