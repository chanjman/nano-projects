# Bubble sorts the array
def bubble_sort(niz)
  left, right, bubble = 0, 1, niz.length
  until bubble < 2
    niz.insert(left, niz.delete_at(right)) if (niz[left] <=> niz[right]) == 1
    left += 1
    right += 1
    (left, right = 0, 1) && (bubble -= 1) if right == bubble
  end
  niz
end

def bubble_sort_by(niz)
  left, right, bubble = 0, 1, niz.length
  until bubble < 2
    niz.insert(left, niz.delete_at(right)) if yield niz[left], niz[right]
    left += 1
    right += 1
    (left, right = 0, 1) && (bubble -= 1) if right == bubble
  end
  niz
end
