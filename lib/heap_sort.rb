

# This method uses a heap to sort an array.
# Time Complexity: O(logn)
# Space Complexity: O(n)
def heap_sort(list)
  return [] if list == []
  return list if list.length == 1
  # list = [5, 27, 3, 16, -50]
  # must_equal [-50, 3, 5, 16, 27]

  heap = MinHeap.new
  list.each do |element|
    heap.add(element, element)
  end

  result = []
  i = 0 
  while i < list.length
    result << heap.remove
    i += 1
  end
  return result
end