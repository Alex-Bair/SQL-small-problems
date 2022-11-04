def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count = 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8]) == true        # should return true
p valid_series?([1, 12, 2, 5, 16, 6]) == false             # should return false
p valid_series?([28, 3, 4, 7, 9, 14]) == false             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3]) == true        # should return true
p valid_series?([10, 6, 19, 2, 6, 4]) == false             # should return false

=begin
The last test case is not passing because on line 5, the variable `odd_count` is being reassigned to the integer 3 instead of being compared with the Integer#== method to 3. Due to the reassignment, `odd_count` will always be truthy and line 5 will always return true.

This can be fixed by changing the reassignment on line 5 into the Integer#== method.
=end

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8]) == true        # should return true
p valid_series?([1, 12, 2, 5, 16, 6]) == false             # should return false
p valid_series?([28, 3, 4, 7, 9, 14]) == false             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3]) == true        # should return true
p valid_series?([10, 6, 19, 2, 6, 4]) == false             # should return false