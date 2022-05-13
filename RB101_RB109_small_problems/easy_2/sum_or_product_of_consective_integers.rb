total = 0
upper_limit = 0

def positive_integer?(num)
  num.to_i > 0 && num.to_i.to_s == num
end

loop do
  puts "Please enter an integer greater than 0: "
  upper_limit = gets.chomp
  break if positive_integer?(upper_limit)
  puts "You did not enter a valid, positive integer."
end

puts "Enter 's' to compute the sum of the numbers between 1 and your integer, or enter 'p' to compute the product of the numbers between 1 and your integer."
operation = gets.chomp.strip

if operation == 's'
  operation = 'sum'
  total = (1..upper_limit.to_i).inject(:+)
elsif operation == 'p'
  operation = 'product'
  total = (1..upper_limit.to_i).inject(:*)
else
  operation = nil
  puts "Please try again - you did not choose 's' or 'p'."
end

puts "The #{operation} of the integers between 1 and #{upper_limit} is #{total}." unless operation.nil?