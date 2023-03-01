def zip(arr1, arr2)
  zipped_arr = []
  
  arr1.size.times do |index|
    zipped_arr << [arr1[index], arr2[index]]
  end
  
  zipped_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# LS Solutions

def zip(array1, array2)
  result = []
  index = 0
  length = array1.length
  while index < length
    result << [array1[index], array2[index]]
    index += 1
  end
  result
end

def zipper(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << [element, array2[index]]
  end
  result
end

def zipper(array1, array2)
  array1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, array2[index]]
  end
end

# JDF's Solution

def zip(arr1, arr2)
  arr1.map.with_index { |el, idx| [el, arr2[idx]] }
end