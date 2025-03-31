local function create_node(node_content)
	return { content = node_content, left = nil, right = nil }
end

local function get_traversal(node)
	local traversal = {}

	Traverse = function(node)
		if node.left ~= nil then
			Traverse(node.left)
		end

		table.insert(traversal, node.content)

		if node.right ~= nil then
			Traverse(node.right)
		end
	end

	Traverse(node)

	return traversal
end

local function reverse_tree(node)
	if node.left ~= nil then
		reverse_tree(node.left)
	end

	if node.right ~= nil then
		reverse_tree(node.right)
	end

  node.left, node.right = node.right, node.left
end

local function print_traversal(traversal)
	for _, node_content in ipairs(traversal) do
		io.write(node_content)
		io.write(", ")
	end

	print()
end

node1 = create_node("4")
node2 = create_node("2")
node3 = create_node("5")
node4 = create_node("1")
node5 = create_node("3")

node1.left = node2
node1.right = node3
node2.left = node4
node2.right = node5

print_traversal(get_traversal(node1))

reverse_tree(node1)

print_traversal(get_traversal(node1))
