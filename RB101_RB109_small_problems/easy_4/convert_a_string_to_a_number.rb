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

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Further Exploration
def hexadecimal_to_integer(string)
  digits = string.upcase.chars.map { |char| DIGITS[char]}
  value = 0
  digits.each { |digit| value = 16 * value + digit }
  value
end

p hexadecimal_to_integer('4D9f') == 19871