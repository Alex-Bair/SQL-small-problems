def drop_while(arr)
  new_arr = []
  falsey_value_found = false
  
  
  arr.each do |element|
    if falsey_value_found
      new_arr << element
    elsif !yield(element)
      falsey_value_found = true
      new_arr << element
    end
  end
  
  new_arr
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

# Refactored with Enumerable#reduce

def drop_while(arr)
  falsey_value_found = false
  
  arr.reduce([]) do |new_arr, element|
    if falsey_value_found
      new_arr + [element]
    elsif !yield(element)
      falsey_value_found = true
      new_arr + [element]
    else
      new_arr
    end
  end
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

# LS Solution

def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end

  array[index..-1]
end