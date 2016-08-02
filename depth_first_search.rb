##
# This class represents a tree
# where each node has an array of children.

class Tree

  ##
  # reads the key of the tree's root
  attr_reader :key

  ## 
  # sets the key of the tree's root node
  # unless intended new key is nil
  # (to remove a node, set the entire node to nil)
  def key=(new_key)
    if !new_key.nil?
      @key = new_key
    end
    @key
  end

  ##
  # sets or reads the array of children for this instance
  attr_accessor :children


  ##
  # Creates a new tree with the root node key specified by 
  # the +key+ param as the @key for the instance
  def initialize(key)
    @key = key
    @children = []
  end


  puts (depth_first_search(target_key));
  ##
  # Searches through tree for a single node whose key is equal to
  # the +target_key+ param. Looks through nodes in a depth-first order,
  # by following each path as deep as it can before backtracking.
  # Returns nil if no such node is found.
  def depth_first_search(target_key)
  # check if key == target_key 
    if key == target_key
    # if equal, return my_tree  
      return self
    # else add my_tree.children to the queue
    else
      children.each do |child_node|
        queue.push child_node
    end
  end
p queue
  # while queue is not empty
  while !queue.empty?
  # get first element in queue (current_element) and remove it from the queue
    current_node = queue.shift
  # check current_element.key == target_key
  if current_node.key == target_key
  # if yes return current_element
    return current_node
  # if no add current_element.children to the queue
  else
    current_node.children.each do |child_node|
      queue.push child_node
     end
  end
p queue 
end
# if (queue  is empty) return nil not found
nil
end
end


my_tree = Tree.new('Q')
r_node = Tree.new('R')
s_node = Tree.new('S')
t_node = Tree.new('T')
u_node = Tree.new('U')
v_node = Tree.new('V')
w_node = Tree.new('W')

my_tree.children << r_node
my_tree.children << s_node
r_node.children << t_node
r_node.children << u_node
r_node.children << v_node
u_node.children << w_node

#          T 
#        /
#     R  -- U -- W
#   /   \
# Q        V
#   \
#     S 

puts "\n-- expect node U --"
u_result = my_tree.depth_first_search('U')
p u_result
# ["Q"]
# ["Q", "R", "S"]
# ["Q", "R", "T", "U", "V"]
# ["Q", "R", "T", "U", "W"]
# ["Q", "R", "T", "U"]
# #<Tree:0x007fe77c29dae0 @key="U", @children=[]>

puts "\n-- expect node W --"
w_result = my_tree.depth_first_search('W')
p w_result
# ["Q"]
# ["Q", "R", "S"]
# ["Q", "R", "T", "U", "V"]
# ["Q", "R", "T", "U", "W"]
# #<Tree:0x007fe77c29dae0 @key="W", @children=[]>

puts "\n-- expect nil -- "
z_result = my_tree.depth_first_search('Z')
p z_result
# ["Q"]
# ["Q", "R", "S"]
# ["Q", "R", "T", "U", "V"]
# ["Q", "R", "T", "U", "W"]
# ["Q", "R", "T", "U"]
# ["Q", "R", "T"]
# ["Q", "R"]
# ["Q"]
# []
# nil



