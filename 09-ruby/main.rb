class Node
  attr_accessor :content
  attr_accessor :left
  attr_accessor :right

  def initialize(content, left = nil, right = nil)
    @content = content
    @left = left
    @right = right
  end
end

def create_node(content)
  return Node.new(content)
end

def print_traversal(traversal)
  traversal.each do |item|
    print "#{item}, " 
    $stdout.flush # to print on same line
  end

  puts ""
end

def get_traversal(node)
  traversal = []

  traverse = -> (node) {
    if node.left != nil
      traverse.call node.left
    end

    traversal.push node.content

    if node.right != nil
      traverse.call node.right
    end
  }

  traverse.call node

  return traversal
end

def reverse_tree(node)
  if (node.left != nil)
    reverse_tree(node.left)
  end

  if (node.right != nil)
    reverse_tree(node.right)
  end

  node.left, node.right = node.right, node.left
end

if __FILE__ == $0
  node1 = create_node "4"
  node2 = create_node "2"
  node3 = create_node "5"
  node4 = create_node "1"
  node5 = create_node "3"

  node1.left = node2
  node1.right = node3
  node2.left = node4
  node2.right = node5

  print_traversal(get_traversal node1)

  reverse_tree node1

  print_traversal(get_traversal node1)
end
