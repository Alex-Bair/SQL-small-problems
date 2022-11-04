def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

#The String#upcase! is a destructive method, however it is not being called on the input string. On line 2, the input string is split into an array of characters with the String#chars method. The characters in the array are different string objects than the input string.
#This array of characters then calls the Array#each method and passes in the block delimited by curly braces {}. Within the block, each character in the array is upcased with the String#upcase! method. This destructively upcases the characters in the array, but not the characters in the input string.

#The code below produces the required output of 'HEY YOU'.

def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'