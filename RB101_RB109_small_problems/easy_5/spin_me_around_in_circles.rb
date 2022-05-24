def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# The #spin_me method will return a different object from the string object passed in as an argument.

input = "hello world"
p input.object_id
p spin_me(input).object_id