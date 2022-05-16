DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(num)
  strings = num.abs.digits.reverse.map {|num| DIGITS[num]}
  strings.join("")
end

def determine_sign(num)
  if num < 0 then "-"
  elsif num > 0 then "+"
  else ""
  end
end

def signed_integer_to_string(num)
  sign = determine_sign(num)
  sign + integer_to_string(num)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

#Further Exploration

def signed_integer_to_string(number)
  string_num = integer_to_string(number.abs)
  case number <=> 0
  when -1 then "-#{string_num}"
  when +1 then "+#{string_num}"
  else         string_num
  end
end
