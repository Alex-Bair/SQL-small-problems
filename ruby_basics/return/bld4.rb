def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal

=begin

The above code will print:

Dinner
Breakfast

The meal method is defined on lines 1-4.

On line 2, the puts method is invoked and passed the string object 'Dinner' as an argument. This prints 'Dinner' to the screen.

On line 3, the string object 'Breakfast' is returned. This makes 'Breakfast' the meal method's return value.

On line 6, the puts method is invoked and the meal method's return value ('Breakfast') is passed in as an argument. This prints 'Breakfast' to the screen.

=end