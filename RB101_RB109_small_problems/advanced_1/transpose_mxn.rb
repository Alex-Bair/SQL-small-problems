#Method written for previous exercise already works for any M x N matrix.

def transpose(matrix)
  new_width = matrix.size
  new_height = matrix[0].size
  
  new_matrix = []
  new_height.times {new_matrix << Array.new}
  
  new_height.times do |new_outer_index|
    new_width.times do |new_inner_index|
      new_matrix[new_outer_index][new_inner_index] = matrix[new_inner_index][new_outer_index]
    end
  end
  
  new_matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]