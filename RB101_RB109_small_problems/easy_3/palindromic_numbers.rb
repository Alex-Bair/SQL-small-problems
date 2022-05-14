def palindromic_number?(num)
  string = num.to_s
  string == string.reverse
end

# The above method will not work if the integer begins with one or more 0s since Ruby thinks the number is octal (base 8) and will convert it to base 10.

# Do not know of a way to get around the leading zero issue due to Ruby's conversion into base 8.