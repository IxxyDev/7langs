# Define a class called Tree
class Tree
  # Define getter and setter methods for the instance variables children and node_name
  attr_accessor :children, :node_name

  # Define an initialize method that takes a name and an optional children array as arguments
  # Define the initialize method that takes a tree_data argument
  def initialize(tree_data)
    # Set the instance variables children and node_name based on the arguments passed to the method
    @node_name = tree_data.keys.first
    @children = tree_data[@node_name].map {|k, v| Tree.new({k => v})}
  end

  # Define a method called visit_all that takes a block as an argument
  def visit_all($block)
    # Call the visit method with the given block on the current instance of Tree
    visit $block
    # Iterate over each child of the current instance of Tree and call the visit_all method recursively with the given block
    children.each {|c| c.visit_all $block}
  end

  # Define a method called visit that takes a block as an argument
  def visit($block)
    # Call the given block with the current instance of Tree as an argument
    $block.call self
  end
end


ruby_tree = Tree.new( "Ruby", [Tree.new("Reia"), Tree.new("MacRuby")] ) # Create a new instance of Tree with the name "Ruby" and two children
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name} # Call the visit method on the instance of Tree with a block that prints the name of the node

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name} # Call the visit_all method on the instance of Tree with a block that prints the name of the node

nested_structure = {
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
}

nested_tree = Tree.new(nested_structure) # Create a new instance of Tree with the nested_structure hash as an argument
nested_tree.visit {|node| puts node.node_name} # Call the visit method on the instance of Tree with a block that prints the name of the node
nested_tree.visit_all {|node| puts node.node_name} # Call the visit_all method on the instance of Tree with a block that prints the name of the node
