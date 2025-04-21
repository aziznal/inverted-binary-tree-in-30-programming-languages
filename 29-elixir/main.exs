defmodule Node do
  defstruct content: nil, left: nil, right: nil

  def create_node(content) do
    %Node{ content: content }
  end

  def create_node(content, left, right) do
    %Node{ content: content, left: left, right: right }
  end

  def get_traversal(node) do
    leftResult = case node.left do
        %Node{} -> get_traversal(node.left)
        _ -> []
    end

    rightResult = case node.right do
        %Node{} -> get_traversal(node.right)
        _ -> []
    end

    leftResult ++ [node.content] ++ rightResult
  end

  def show_traversal(traversal) do
    IO.puts(Enum.join(traversal, ", "))
  end

  def reverse_tree(node) do
    reversedLeft = case node.left do
      %Node{} -> reverse_tree(node.left)
      _ -> nil
    end

    reversedRight = case node.right do
      %Node{} -> reverse_tree(node.right)
      _ -> nil
    end

    create_node(node.content, reversedRight, reversedLeft)
  end
end

defmodule Main do
  def foo() do
    IO.puts "Hello World!"
  end
end


leaf1 =  Node.create_node("1")
leaf2 =  Node.create_node("3")
leaf3 =  Node.create_node("5")
node2 =  Node.create_node("2", leaf1, leaf2)
node1 =  Node.create_node("4", node2, leaf3)

Node.show_traversal Node.get_traversal node1

Node.show_traversal Node.get_traversal Node.reverse_tree node1
