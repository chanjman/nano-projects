# Containing node value and next pointer
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Representing full list
class LinkedList
  attr_accessor :head, :tail

  def initialize(value)
    @head = Node.new(value)
    @tail = @head
  end

  def append(value)
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
  end

  def prepend(value)
    new_head = Node.new(value, @head)
    @head = new_head
  end

  def at(index)
    curr_node = @head
    position = 0
    until curr_node.nil?
      return curr_node if index == position
      position += 1
      curr_node = curr_node.next_node
    end
  end

  def size
    curr_node = @head
    list_size = 0
    until curr_node.nil?
      list_size += 1
      curr_node = curr_node.next_node
    end
    list_size
  end

  def pop
    @tail = self.at(self.size - 2)
    @tail.next_node = nil
  end

  def contains?(value)
    (0..self.size - 1).each do |idx|
      return true if self.at(idx).value.to_s.casecmp(value).zero?
    end
    false
  end

  def find(data)
    (0..self.size - 1).each do |idx|
      return idx if self.at(idx).value.to_s.casecmp(data).zero?
    end
    nil
  end

  def to_s
    visual_list = []
    (0..self.size - 1).each do |idx|
      visual_list << "( #{self.at(idx).value} ) -> "
    end
    "#{visual_list.join} nil"
  end

  def insert_at(value, index)
    self.at(index - 1).next_node = Node.new(value, self.at(index))
  end

  def remove_at(index)
    self.at(index - 1).next_node = self.at(index + 1)
  end
end
