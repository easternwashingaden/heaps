class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(logn) - we just look at the sub children only
  # Space Complexity: O(1)
  def add(key, value = key)
    # New node is added to the end (last element of the array)
    @store << HeapNode.new(key, value)
    last_index = @store.length - 1
    heap_up(last_index)  #Using heap_up helper method 
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def remove() # removes the element at the first position (root) of the array
    return nil if @store.empty?
    last_index = @store.length - 1
    # First, swap the last leaf & the root node
    swap(0, last_index)

    # Delete the last leaf (last item in the array)
    result = @store.pop

    # Then heap-down the new root, to reestablish the heap property
    # start heap_down with the root (index 0)
    heap_down(0) 
    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return if @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn)
  # Space complexity: O(1)
  def heap_up(index)
    return if index == 0
    parent = (index - 1 ) / 2
    # Compare the new node with it's parent
    # If they are out of order swap and heap-up
    if @store[parent].key > @store[index].key
      #swap
      swap(index, parent)
      #continue heap-up
      heap_up(parent)
    end
 
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child_index = index * 2 + 1
    right_child_index = index * 2 + 2
    #check to see if the right child exists
    if @store[right_child_index] != nil
      # Define the min_child
      min_child = @store[right_child_index].key < @store[left_child_index].key ? right_child_index : left_child_index
      # if the min_child less than the parent, swap it and continue heaping down
      if @store[min_child].key < @store[index].key
        swap(min_child, index)
        heap_down(min_child)
      end
    elsif @store[left_child_index] != nil #check to see if the left child exists
      if @store[left_child_index].key < @store[index].key #if the min_child less than the parent, swap it and continue heaping down
        swap(left_child_index, index)
        heap_down(left_child_index)
      end
    end
     
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end