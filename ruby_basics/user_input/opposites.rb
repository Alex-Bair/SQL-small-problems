def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num1 = nil
num2 = nil
sum = nil

puts ">> We'll be doing some addition today! You must provide 1 positive integer and 1 negative integer. Zeros are not allowed."

loop do
  
  loop do
    puts ">> Please enter the first positive or negative integer:"
    num1 = gets.chomp
    break if valid_number?(num1)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end

  loop do
    puts ">> Please enter the second postiive or negative integer:"
    num2 = gets.chomp
    break if valid_number?(num2)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
  
  num1 = num1.to_i
  num2 = num2.to_i
  
  break unless (num1.positive? && num2.positive?) || (num1.negative? && num2.negative?)
  
  puts ">> Sorry. One integer must be positive, the other must be negative."
  puts ">> Please start over."
end

sum = num1 + num2

puts ">> #{num1} + #{num2} = #{sum}"