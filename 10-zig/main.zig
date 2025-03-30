const std = @import("std");

const Node = struct {
    content: []const u8,
    left: ?*Node,
    right: ?*Node,
};

fn create_node(content: []const u8) Node {
    return Node {
        .content = content,
        .left = null,
        .right = null
    };
}

fn traverse(node: *Node, traversal: *std.ArrayList([]const u8)) !void {
    if (node.left) |left_node| {
        try traverse(left_node, traversal);
    }

    try traversal.append(node.content);

    if (node.right) |right_node| {
        try traverse(right_node, traversal);
    }
}

fn get_traversal(node: *Node, allocator: std.mem.Allocator) !std.ArrayList([]const u8) {
    var traversal = std.ArrayList([]const u8).init(allocator);
    errdefer traversal.deinit(); // Ensure cleanup on error 

    try traverse(node, &traversal);

    return traversal;
}

fn reverse_tree(node: *Node) void {
    if (node.left) |left_node| {
        reverse_tree(left_node);
    }

    if (node.right) |right_node| {
        reverse_tree(right_node);
    }

    const node_left = node.left;
    const node_right = node.right;

    node.right = node_left;
    node.left = node_right;
}

fn print_traversal(traversal: std.ArrayList([] const u8)) void {
    for (traversal.items) |item| {
        std.debug.print("{s}, ", .{item});
    }

    std.debug.print("\n", .{});
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var node1 = create_node("4");
    var node2 = create_node("2");
    var node3 = create_node("5");
    var node4 = create_node("1");
    var node5 = create_node("3");

    node1.left = &node2;
    node1.right = &node3;
    node2.left = &node4;
    node2.right = &node5;

    var traversal = try get_traversal(&node1, allocator);
    defer traversal.deinit();

    print_traversal(traversal);

    reverse_tree(&node1);

    var reversed_traversal = try get_traversal(&node1, allocator);
    defer reversed_traversal.deinit();

    print_traversal(reversed_traversal);
}

