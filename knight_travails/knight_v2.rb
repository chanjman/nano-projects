# One knight to rule them all
class Knight
  def knight_moves(from, to)
    root = Node.new(from)
    build_tree(root)
    find_path(root, to)
  end

  def build_tree(from)
    visited = []
    queue = [from]
    64.times do
      possible_moves(queue.first.coordinate).each do |move|
        queue.push(Node.new(move, queue.first))
      end
      v = queue.shift
      visited << v unless v == from or visited.include? v
    end
    visited
  end

  def find_path(from, to)
    queue = [from]
    until from.coordinate == to
      curr_node = queue.pop
      next if curr_node.nil?
      return curr_node.coordinate if curr_node.coordinate.eql? to
      queue.unshift(curr_node.left_child, curr_node.right_child)
    end
  end

  def possible_moves(start)
    knight_move_rules.map { |move| [start[0] + move[0], start[1] + move[1]] }
                     .reject { |move| off_the_board?(move) }
  end

  def knight_move_rules
    [-2, 2].product([-1, 1]).concat([-1, 1].product([-2, 2])).sort
  end

  def board
    (0..7).to_a.repeated_permutation(2).to_a.sort
  end

  def off_the_board?(move)
    move.any? { |coordinate| coordinate < 0 or coordinate > 7 }
  end
end

# Knight move nodes
class Node
  attr_accessor :coordinate, :parent

  def initialize(coordinate = nil, parent = nil)
    @coordinate = coordinate
    @parent = parent
  end
end

k = Knight.new
p k.build_tree(Node.new([0, 0]))
