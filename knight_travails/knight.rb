# One knight to rule them all
class Knight
  def knight_moves(from, to)
    root = Node.new(from)
    show_moves(build_path(build_tree(root, to)))
  end

  def build_tree(from, to)
    queue = [from]
    until queue[0].coordinate == to
      possible_moves(queue[0].coordinate).each do |move|
        unless queue[0].coordinate.include? move
          queue.push(Node.new(move, queue[0]))
        end
      end
      queue.shift
    end
    queue
  end

  def build_path(queue)
    path = [queue[0]]
    until queue[0].parent.nil?
      path.unshift queue[0].parent
      queue[0] = queue[0].parent
    end
    path
  end

  def show_moves(path)
    print "You made it in #{path.length - 1} moves! Your path: "
    path.each_with_index do |square, idx|
      print square.coordinate
      print ' -> ' if idx < path.length - 1
    end
    print "\n"
  end

  def possible_moves(start)
    knight_move_rules.map { |move| [start[0] + move[0], start[1] + move[1]] }
                     .reject { |move| off_the_board?(move) }
  end

  def knight_move_rules
    [-2, 2].product([-1, 1]).concat([-1, 1].product([-2, 2])).sort
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
k.knight_moves([0, 0], [4, 5])
