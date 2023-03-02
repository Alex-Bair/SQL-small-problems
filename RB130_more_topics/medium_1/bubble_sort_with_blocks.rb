# Modifying my solution

def bubble_sort!(arr)
  penultimate_index = arr.size - 2
  loop do
    swap_performed = false
    0.upto(penultimate_index) do |index|
      if block_given?
        next if yield(arr[index], arr[index + 1])
      else
        next if arr[index] <= arr[index + 1]
      end

      arr[index], arr[index + 1] = arr[index + 1], arr[index]
      swap_performed = true
    end

    break unless swap_performed
  end
end

# Modifying LS provided #bubble_sort! method

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       condition = block_given? ? yield(array[index - 1], array[index]) : array[index - 1] <= array[index]
#       next if condition
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

#Further Exploration


def bubble_sort!(arr)
  penultimate_index = arr.size - 2
  loop do
    swap_performed = false
    0.upto(penultimate_index) do |index|
      if block_given?
        next if yield(arr[index]) <= yield(arr[index + 1])
      else
        next if arr[index] <= arr[index + 1]
      end

      arr[index], arr[index + 1] = arr[index + 1], arr[index]
      swap_performed = true
    end

    break unless swap_performed
  end
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)


# Rainy McDowell's solution using a Proc

def bubble_sort!(array)
  swap =  if block_given?
            Proc.new
          else
            Proc.new { |a, b| a <= b } unless block_given?
          end
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if swap.call(array[index - 1], array[index])
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end