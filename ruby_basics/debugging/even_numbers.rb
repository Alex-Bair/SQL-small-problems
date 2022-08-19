numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.map do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]

=begin

The map method creates a new array with the return value of the block for each iteration. This is transformation, so the new array will contain the same number of elements as the numbers array.
We want to perform selection, not transformation. We can use the select method to only select the even elements based on the truthiness of the block's return value.

=end

numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n.even?
end

p even_numbers # expected output: [2, 6, 8]