# Multiply All Pairs

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(arr_1, arr_2)
  out_arr = []
  for j in 0..(arr_2.size - 1)
    for i in 0..(arr_1.size - 1)
      out_arr << arr_1[i] * arr_2[j]
    end
  end
  out_arr.sort
end

# LS Solution
def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end

# LS Solution #2 (compact solution)
def multiply_all_pairs(array_1, array_2)
  # p array_1.product(array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
p multiply_all_pairs([2, 4], [4, 3, 1, 2])

