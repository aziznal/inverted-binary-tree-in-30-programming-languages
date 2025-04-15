mutable struct Node
  content::AbstractString
  left::Union{Node, Nothing}
  right::Union{Node, Nothing}
end

function create_node(
  content::String,
  left::Union{Node, Nothing} = nothing,
  right::Union{Node, Nothing} = nothing)
  return Node(content, left, right)
end

function get_traversal(node::Node)
  left_traversal = []
  if node.left isa Node
    left_traversal = get_traversal(node.left)
  end

  right_traversal = []
  if node.right isa Node
    right_traversal = get_traversal(node.right)
  end

  return vcat(left_traversal, [node.content], right_traversal)
end

function reverse_tree(node::Union{Node, Nothing})
  if node isa Nothing return nothing end

  reversed_left = reverse_tree(node.left)
  reversed_right = reverse_tree(node.right)

  return create_node(node.content, reversed_right, reversed_left)
end

node1 = create_node("4")
node2 = create_node("2")
node3 = create_node("5")
node4 = create_node("1")
node5 = create_node("3")

node1.left = node2;
node1.right = node3;
node2.left = node4;
node2.right = node5;

println(get_traversal(node1))

println(get_traversal(reverse_tree(node1)))

