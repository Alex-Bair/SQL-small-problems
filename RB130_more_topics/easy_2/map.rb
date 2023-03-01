def map(arr)
  if block_given?
    transformed_arr = []
    arr.each do |element1, element2|
      transformed_arr << yield(element1, element2)
    end
    transformed_arr
  else
    arr.to_enum
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# JDF's Solution

def map(arr)
  if block_given?
    arr.each_with_object([]) do |el, new_arr|
      new_arr << yield(el)
    end
  else
    arr.to_enum
  end
end

# Ethan Weiner's Solution - leverages block's lenient arity to allow up to pass up to two argument to the block via yield.

def map(collection)
  result = []
  collection.each { |el1, el2| result << yield(el1, el2) }
  result
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36] # Arrays work: `el2` is simply assigned to `nil`
p map([1, 3, 6]) { |val1, val2| val2 } == [nil, nil, nil] # `el2` is assigned to `nil`
p map({ a: 1, b: 2, c: 3}) { |key, value| "#{key}: #{value * 2}" } == ["a: 2", "b: 4", "c: 6"] # Hashes work