def max_by(arr)
  return nil if arr.empty?
  
  selected_element = arr[0]
  largest_value = yield(arr[0])
  
  arr[1..].each do |element|
    current_value = yield(element)
    if current_value > largest_value
      largest_value = current_value
      selected_element = element
    end
  end
  
  selected_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil