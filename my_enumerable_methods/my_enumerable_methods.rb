require 'ap'

module Enumerable
  def my_each
    return enum_for(__method__) unless block_given?
    for i in 0...self.length
      yield self[i]
    end
  end

  def my_each_with_index
    return enum_for(__method__) unless block_given?
    for i in 0...self.length
      yield self[i], self.index(self[i])
    end
  end

  def my_select
    return enum_for(__method__) unless block_given?
    selection = []
    self.my_each { |i| selection.push(i) if yield i }
    selection
  end

  def my_all?
    return self.my_all? { |x| x } unless block_given?
    result = true
    self.my_each { |i| result = (yield i) && result }
    result ? true : false
  end

  def my_any?
    return self.my_any? { |i| i } unless block_given?
    result = false
    self.my_each { |i| result = (yield i) || result }
    result ? true : false
  end

  def my_none?
    return enum_for(__method__) unless block_given?
    result = false
    self.my_each { |i| result = (yield i) || result }
    result ? false : true
  end

  def my_count(arg = nil)
    count = 0
    if block_given?
      self.my_each { |i| count += 1 if yield i }
    else
      self.my_each { |i| count += 1 if i == arg }
    end
    count
  end

  def my_map
    return enum_for(__method__) unless block_given?
    mapped = []
    self.my_each { |i| mapped.push(yield i) }
    mapped
  end

  def my_inject
    memo = nil
    self.to_a.my_each_with_index { |i, j| j.zero? ? memo = i : memo = (yield memo, i) }
    memo
  end

  def my_map_v2(arg = nil)
    mapped = []
    if arg.nil? && block_given?
      self.my_each { |i| mapped.push(yield i) }
    elsif !arg.nil?
      self.my_each { |i| mapped << arg.call(i) }
    elsif !arg.nil? && block_given?
      self.my_each { |i| mapped << arg.call(i) }
    end
    mapped
  end
end

ary = [17, 21, 13, 4, 56, 8]
ap ary.my_each
ap ary.my_each { |x| p x + 1 }
ap ary.my_each_with_index { |x, idx| p "#{x} index is #{idx}" }
ap ary.my_select { |x| x > 17 }
ap ary.my_all?(&:even?)
ap ary.my_any? { |x| x > 17 }
ap ary.my_none?
ap ary.my_none? { |x| x < 2 }
ap ary.my_count(4)
ap ary.my_count { |x| x > 15 }
ap ary.my_map { |x| x**2 }
ap ary.my_map
ap ary.my_inject { |x, y| x + y }
procic = Proc.new { |x| x**4 }
ap ary.my_map_v2(procic)
ap ary.my_map_v2 { |x| x**2 }
ap ary.my_map_v2(procic) { |x| x**3 }
