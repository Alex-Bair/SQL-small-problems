# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# 10.times do
#   puts counter
#   decrease(counter)
# end

# puts 'LAUNCH!'

# The above code does not behave as required because the local variable counter initialized on line 5 cannot be mutated from within the #decreased method defined on lines 1-3.
# In Ruby, numbers are immutable, which means there are no methods that can change an Integer object. So there's no way to change the object that local variable counter points to from inside the #decrease method.
# To make this code count down from 10 to 1, we can reassign local variable counter to itself minus 1 on line 9 instead of passing `counter` into the #decrease method as an argument.

counter = 10

10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'

#Further Exploration

counter = 10

counter.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'