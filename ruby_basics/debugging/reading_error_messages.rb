def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

#find_first_nonzero_among(0, 0, 1, 0, 2, 0)
find_first_nonzero_among(1)

=begin

The first example raises an ArgumentError message. The method find_first_nonzero_among only expects a single argument, not multiple arguments.

The second example raises a NoMethodError message. The Integer 1 is provided as an argument, however there is no each method defined for Integers. This causes an error when trying to call the each method with an Integer argument.

=end