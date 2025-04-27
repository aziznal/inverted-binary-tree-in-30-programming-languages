type Node =
  { Content : string
    Left    : Node option
    Right   : Node option }

let createNode content left right = { Content = content; Left = left; Right = right }

let rec getTraversal node =
  let leftResult = 
    match node.Left with
      | Some(nodeLeft) -> getTraversal nodeLeft
      | _ -> []

  let rightResult = 
    match node.Right with
      | Some(nodeRight) -> getTraversal nodeRight
      | _ -> []

  leftResult @ [node.Content] @ rightResult

let rec reverseTree node =
  let reversedLeft =
    match node.Left with
      | Some(nodeLeft) -> Some(reverseTree nodeLeft)
      | _ -> None

  let reversedRight =
    match node.Right with
      | Some(nodeRight) -> Some(reverseTree nodeRight)
      | _ -> None

  createNode node.Content reversedRight reversedLeft

let leaf1 = createNode "1" None None
let leaf2 = createNode "3" None None
let leaf3 = createNode "5" None None
let node2 = createNode "2" (Some leaf1) (Some leaf2)
let node1 = createNode "4" (Some node2) (Some leaf3)

printfn "%A" (getTraversal node1)

printfn "%A" (getTraversal (reverseTree node1))

