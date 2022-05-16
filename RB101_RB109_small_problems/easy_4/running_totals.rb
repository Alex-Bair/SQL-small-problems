def running_total(array)
  new_arr = []
  total = 0
  array.each do |v|
    total += v
    new_arr << total
  end
  new_arr
end

#LS Solution

def running_total(array)
  sum = 0
  array.map { |v| sum += v}
end

#Further Exploration

def running_total(array)
  sum = 0
  array.each_with_object([]) do |i, new_arr|
    new_arr << (sum += i)
  end
end

def running_total(array)
  sum = 0
  array.inject([]) do |new_arr, i|
    new_arr << (sum += i)
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []