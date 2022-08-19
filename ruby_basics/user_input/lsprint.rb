number = nil

loop do
  
  puts ">> How many output lines do you want? Enter a number >= 3:"
  
  number = gets.chomp.to_i
  
  break if number >= 3
  
  puts ">> Invalid input. Provide a number >= 3."
end

number.times {|_| puts "Launch School is the best!"}