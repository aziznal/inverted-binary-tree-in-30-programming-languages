%% this line is ignored by escript
-record(node, {content, left, right}).

create_node([{content, Content}]) -> 
    #node{ content = Content, left = null, right = null };
create_node([ {content, Content}, {left, Left}, {right, Right} ]) -> 
    #node{ content = Content, left = Left, right = Right }.

show_traversal(Traversal) ->
    io:format(lists:join(", ", Traversal)),
    io:format("\n").

get_traversal(Node) ->
    LeftResult = case Node#node.left of
                     #node{} -> get_traversal(Node#node.left);
                     _       ->  []
                 end,
    RightResult = case Node#node.right of
                     #node{} -> get_traversal(Node#node.right);
                     _       ->  []
                 end,
    LeftResult ++ [Node#node.content] ++ RightResult.

reverse_tree(Node) ->
    ReversedLeft = case Node#node.left of
                       #node{} -> reverse_tree(Node#node.left);
                       _       -> null 
                   end,
    ReversedRight = case Node#node.right of
                       #node{} -> reverse_tree(Node#node.right);
                       _       -> null 
                   end,
    create_node([{ content, Node#node.content },
                 { left, ReversedRight },
                 { right, ReversedLeft }]).


main(_) -> 
    Leaf1 =  create_node([{content, "1"}]),
    Leaf2 =  create_node([{content, "3"}]),
    Leaf3 =  create_node([{content, "5"}]),

    Node2 =  create_node([{content, "2"}, {left, Leaf1}, {right, Leaf2}]),
    Node1 =  create_node([{content, "4"}, {left, Node2}, {right, Leaf3}]),

    show_traversal (get_traversal (Node1)),
    show_traversal (get_traversal (reverse_tree (Node1))).
