password = nil

def set_password
  puts 'What would you like your password to be?'
  gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)

# The problem is that the password asked for in the #set_password method is not accessible outside of the #set_password method's scope. The #set_password method does return the object the user chose as the password, but that return value is not assigned to a variable outside of the method.
# This can be fixed by assigning the #set_password return value to the local variable `password`. We will also need to pass in local variable `password` into the #verify_password method and update the #verify_password method accordingly.

