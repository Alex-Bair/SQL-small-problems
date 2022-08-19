USERNAME = 'Alex'
PASSWORD = 'your password'

loop do
  puts ">> Please enter user name:"
  
  user_try = gets.chomp
  
  puts ">> Please enter your password:"
  
  password_try = gets.chomp
  
  break if password_try == PASSWORD && user_try == USERNAME
  
  puts ">> Authorization failed!"
end

puts ">> Welcome!"