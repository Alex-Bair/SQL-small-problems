def palindrome?(str_or_arr)
  str_or_arr == str_or_arr.reverse
end

string = "madam"
array = ['a', 'b', 'a']

p palindrome?(string)
p palindrome?(array)