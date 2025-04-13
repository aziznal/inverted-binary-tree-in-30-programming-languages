use warnings;
use strict;

sub create_node {
  my ($content, $left, $right) = @_;
  return {content => $content, left => $left, right => $right};
}

sub get_traversal {
  my ($node) = @_;

  my @left_result = do {
    if (defined $node->{left}) { get_traversal ($node->{left}) }
    else { () }
  };

  my @right_result = do {
    if (defined $node->{right}) { get_traversal ($node->{right}) }
    else { () }
  };

  return (@left_result, $node->{content}, @right_result);
}

sub reverse_tree {
  my ($node) = @_;

  my $reversed_left = do {
    if (defined $node->{left}) { reverse_tree($node->{left}); }
    else { undef };
  };

  my $reversed_right = do {
    if (defined $node->{right}) { reverse_tree($node->{right}); }
    else { undef };
  };

  return create_node($node->{content}, $reversed_right, $reversed_left);
}

my $node1 = create_node("4", undef, undef);
my $node2 = create_node("2", undef, undef);
my $node3 = create_node("5", undef, undef);
my $node4 = create_node("1", undef, undef);
my $node5 = create_node("3", undef, undef);

$node1->{left} = $node2;
$node1->{right} = $node3;
$node2->{left} = $node4;
$node2->{right} = $node5;

print join(", ", get_traversal($node1)) . "\n";

print join(", ", get_traversal(reverse_tree($node1))) . "\n";

