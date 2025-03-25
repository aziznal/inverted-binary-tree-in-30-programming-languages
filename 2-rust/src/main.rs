#[derive(Debug)]
// Used `Box` to own children since struct references itself and lifetimes are a pain 
struct Node {
    content: String,
    left: Option<Box<Node>>,
    right: Option<Box<Node>>,
}

// Creates a new node
fn node(content: &str, left: Option<Box<Node>>, right: Option<Box<Node>>) -> Node {
    return Node {
        content: String::from(content),
        left: left,
        right: right,
    };
}

fn traverse(node: &Node) -> Vec<String> {
    let mut traversal: Vec<String> = vec![];
    let mut stack: Vec<&Node> = vec![];
    let mut current = Some(node);

    // @see https://www.geeksforgeeks.org/inorder-tree-traversal-without-recursion/
    while current.is_some() || stack.len() > 0 {
        while current.is_some() {
            stack.push(current.unwrap());
            current = current.unwrap().left.as_deref();
        }

        current = stack.pop();
        traversal.push(current.unwrap().content.to_string());

        current = current.unwrap().right.as_deref();
    }

    return traversal;
}

fn reverse_tree(node: &mut Node) -> () {
    let mut stack: Vec<&mut Node> = vec![];

    stack.push(node);

    while let Some(current) = stack.pop() {
        // swap left and right
        std::mem::swap(&mut current.left, &mut current.right);

        // do same for all left children
        if let Some(ref mut left) = current.left {
            stack.push(left);
        }

        // ... and for right children
        if let Some(ref mut right) = current.right {
            stack.push(right);
        }
    }
}

#[test]
fn test_reverse_binary_tree() {
    let mut node1 = node("4", None, None);
    let mut node2 = node("2", None, None);
    let node3 = node("5", None, None);
    let node4 = node("1", None, None);
    let node5 = node("3", None, None);

    node2.left = Some(Box::new(node4));
    node2.right = Some(Box::new(node5));
    node1.left = Some(Box::new(node2));
    node1.right = Some(Box::new(node3));

    let traversal = traverse(&node1);

    assert_eq!(traversal, vec!["1", "2", "3", "4", "5"]);

    reverse_tree(&mut node1);

    let reverse_traversal = traverse(&node1);

    assert_eq!(reverse_traversal, vec!["5", "4", "3", "2", "1",]);
}
