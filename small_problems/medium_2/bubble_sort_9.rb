# Bubble Sort

def bubble_sort!(arr)
  num_elems = arr.size

  loop do
    swapped = false

    for i in 1..(num_elems - 1)
      # If out of order
      if arr[i-1] > arr[i]
        # swap elements
        arr[i-1], arr[i] = arr[i], arr[i-1]
        swapped = true
      end
    end
    break if swapped == false
  end
end

# LS Solution
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

# Further Exploration
def bubble_sort!(arr)
  num_elems = arr.size

  loop do
    swapped = false

    for i in 1..(num_elems - 1)
      # If out of order
      if arr[i-1] > arr[i]
        # swap elements
        arr[i-1], arr[i] = arr[i], arr[i-1]
        swapped = true
      end
    end
    num_elems -= 1
    break if swapped == false
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)