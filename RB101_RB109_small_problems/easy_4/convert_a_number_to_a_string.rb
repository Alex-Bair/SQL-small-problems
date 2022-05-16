DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(num)
  strings = num.digits.reverse.map {|num| DIGITS[num]}
  strings.join("")
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

#Further Exploration
=begin
Mutating String methods not ending in ! include:
  []=
  concat
  replace
  insert
  
Mutating Array methods not ending in ! include:
  []=
  append
  push
  <<
  unshift
  pop
  prepend
  shift
  insert
  delete
  delete_at
  delete_if
  keep_if
  
Mutating Hash methods not ending in ! include:
  []=
  clear
  delete
  delete_if
  keep_if
  update
  rehash
  shift
=end