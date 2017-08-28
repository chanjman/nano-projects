# Bubble sorts the array
def bubble_sort(ary)
  left, right, bubble = 0, 1, ary.length
  until bubble < 2
    ary.insert(left, ary.delete_at(right)) if (ary[left] <=> ary[right]) == 1
    left += 1
    right += 1
    (left, right = 0, 1) && (bubble -= 1) if right == bubble
  end
  ary
end

def bubble_sort_by(ary)
  left, right, bubble = 0, 1, ary.length
  until bubble < 2
    ary.insert(left, ary.delete_at(right)) if yield ary[left], ary[right]
    left += 1
    right += 1
    (left, right = 0, 1) && (bubble -= 1) if right == bubble
  end
  ary
end

start_time = Time.now
array_to_sort = Array.new(125) { rand(10.000) }
50_000.times { bubble_sort(array_to_sort) }
end_time = Time.now

puts "Sorted in #{end_time - start_time} seconds"
