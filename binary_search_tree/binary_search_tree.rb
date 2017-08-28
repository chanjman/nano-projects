# Keeps track of node's values and links
class Node
  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value, parent = nil, left_child = nil, right_child = nil)
    @value = value
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end
end

# Binary tree logic
class BinaryTree
  attr_accessor :root

  def initialize(value = nil)
    @root = nil || Node.new(value)
  end

  def build_tree(ary)
    @root = Node.new(ary.shift)
    ary.each { |value| insert_node(value, @root) }
  end

  def insert_node(value, curr_node)
    value < curr_node.value ? insert_left(value, curr_node) : insert_right(value, curr_node)
  end

  def insert_left(value, curr_node)
    if curr_node.left_child.nil?
      curr_node.left_child = Node.new(value, curr_node)
    else
      insert_node(value, curr_node.left_child)
    end
  end

  def insert_right(value, curr_node)
    if curr_node.right_child.nil?
      curr_node.right_child = Node.new(value, curr_node)
    else
      insert_node(value, curr_node.right_child)
    end
  end

  def breadth_first_search(value)
    queue = [@root]
    until queue.empty?
      curr_node = queue.pop
      next if curr_node.nil?
      return curr_node if curr_node.value.eql? value
      queue.unshift(curr_node.left_child, curr_node.right_child)
    end
  end

  def depth_first_search(value)
    stack = [@root]
    until stack.empty?
      curr_node = stack.pop
      next if curr_node.nil?
      return curr_node if curr_node.value.eql? value
      stack.push(curr_node.left_child, curr_node.right_child)
    end
  end

  def dfs_rec(value, curr_node = @root)
    unless curr_node.nil?
      return curr_node if curr_node.value.eql? value
      return value < curr_node.value ? dfs_rec(value, curr_node.left_child) : dfs_rec(value, curr_node.right_child)
    end
    nil
  end

  # Depth first traversal methods

  def preorder(curr_node)
    return if curr_node.nil?
    print "#{curr_node.value} "
    preorder(curr_node.left_child)
    preorder(curr_node.right_child)
  end

  def inorder(curr_node)
    return if curr_node.nil?
    inorder(curr_node.left_child)
    print "#{curr_node.value} "
    inorder(curr_node.right_child)
  end

  def postorder(curr_node)
    return if curr_node.nil?
    postorder(curr_node.right_child)
    postorder(curr_node.left_child)
    print "#{curr_node.value} "
  end
end

bt = BinaryTree.new
ary = [33, 11, 37, 9, 22, 21, 17, 89, 56, 45, 77, 99, 34, 29, 76, 5, 69, 19]
bt.build_tree(ary)

t1 = Time.now
bfs = bt.breadth_first_search(56)
t1e = Time.now - t1

t2 = Time.now
dfs = bt.depth_first_search(56)
t2e = Time.now - t2

t3 = Time.now
dfsrec = bt.dfs_rec(56)
t3e = Time.now - t3
puts ''
puts "56 is parent of #{bfs.parent.value}; his smaller child is #{bfs.left_child.value}; his bigger child is #{bfs.right_child.value}. Time to find: #{t1e * 1000}"
puts "56 is parent of #{dfs.parent.value}; his smaller child is #{dfs.left_child.value}; his bigger child is #{dfs.right_child.value}. Time to find: #{t2e * 1000}"
puts "56 is parent of #{dfsrec.parent.value}; his smaller child is #{dfsrec.left_child.value}; his bigger child is #{dfsrec.right_child.value}. Time to find: #{t3e * 1000}"
puts ''
print 'Preorder: '
t4 = Time.now
bt.preorder(bt.root)
t4e = Time.now - t4
puts " | Time to execute: #{t4e * 1000}"

print 'Inorder: '
t5 = Time.now
bt.inorder(bt.root)
t5e = Time.now - t5
puts " | Time to execute: #{t5e * 1000}"

print 'Postorder: '
t6 = Time.now
bt.postorder(bt.root)
t6e = Time.now - t6
puts " | Time to execute: #{t6e * 1000}"
puts ''
