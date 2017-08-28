def merge(left, right, ary)
  nleft = left.size
  nright = right.size

  ary_idx = 0
  left_idx = 0
  right_idx = 0

  while left_idx < nleft && right_idx < nright
    if left[left_idx] < right[right_idx]
      ary[ary_idx] = left[left_idx]
      left_idx += 1
    else
      ary[ary_idx] = right[right_idx]
      right_idx += 1
    end
    ary_idx += 1
  end

  while left_idx < nleft
    ary[ary_idx] = left[left_idx]
    ary_idx += 1
    left_idx += 1
  end

  while right_idx < nright
    ary[ary_idx] = right[right_idx]
    ary_idx += 1
    right_idx += 1
  end
  ary
end

def merge_sort(ary)
  n = ary.size
  return ary if n < 2
  mid = n / 2
  left = ary[0..mid - 1]
  right = ary[mid..n]

  merge_sort(left)
  merge_sort(right)
  merge(left, right, ary)
end

start_time = Time.now
array_to_sort = Array.new(125) { rand(10.000) }
50_000.times { merge_sort(array_to_sort) }
end_time = Time.now

puts "Sorted in #{end_time - start_time} seconds"
