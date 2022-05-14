def odd_list1(arr)
  arr.select.with_index do |num, idx|
    num if idx.even?
  end
end

def odd_list2(arr)
  new_arr = []
  for i in 0...arr.length
    new_arr << arr[i] if i.even?
  end
  new_arr
end

def odd_list3(arr)
  new_arr = []
  i = 0
  until i >= arr.length
    new_arr << arr[i]
    i += 2
  end
  new_arr
end

def even_list1(arr)
  arr.select.with_index do |num, idx|
    num if idx.odd?
  end
end

def even_list2(arr)
  new_arr = []
  for i in 0...arr.length
    new_arr << arr[i] if i.odd?
  end
  new_arr
end

def even_list3(arr)
  new_arr = []
  i = 1
  until i >= arr.length
    new_arr << arr[i]
    i += 2
  end
  new_arr
end

arr = [1, 2, 3, 4, 5, 6]
p odd_list1(arr)
p odd_list2(arr)
p odd_list3(arr)
p even_list1(arr)
p even_list2(arr)
p even_list3(arr)