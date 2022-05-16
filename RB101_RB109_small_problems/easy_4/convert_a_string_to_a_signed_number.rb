DIGITS = {
  "0" => 0,
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "A" => 10,
  "B" => 11,
  "C" => 12,
  "D" => 13,
  "E" => 14,
  "F" => 15
}

def string_to_integer(string)
  string_array = string.split("")
  num = 0
  exponent = 0
  until string_array.empty?
    num += (DIGITS[string_array.pop] * (10 ** exponent))
    exponent += 1
  end
  num
end

def string_to_signed_integer(string)
  sign = 1
  if string[0] == "+" || string[0] == "-"
    sign = string.slice!(0)
    sign == "-" ? sign = -1 : sign = 1
  end
  string_to_integer(string) * sign
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# Further Exploration
def string_to_signed_integer(string)
  sign = string.start_with?("-") ? -1 : 1
  number = string.start_with?("-", "+") ? string[1..-1] : string
  
  string_to_integer(number) * sign
end