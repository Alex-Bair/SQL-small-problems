def meal
  'Dinner'
  puts 'Dinner'
end

p meal

=begin

The above code will print:

Dinner
nil

The meal method is defined on lines 1-4. On line 3, the puts method is invoked with the string object 'Dinner' as an argument. This prints 'Dinner' to the screen and returns nil. Since this is the last line of the method, nil is also the method's return value.

The p method is invoked on line 6 and the meal method's return value (nil) is passed to the p method as an argument. This will print nil to the screen.

=end