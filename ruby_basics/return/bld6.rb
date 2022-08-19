def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal

=begin

The above code will print:

Breakfast

The meal method is defined on lines 1-5. On line 2 within the meal method definition, the string object 'Breakfast' is returned. The return keywork will immediately exit the method, and this makes the meal method's return value 'Breakfast'.

On line 7, the puts method is invoked and the meal method's return value ('Breakfast') is passed in as an argument. This will print 'Breakfast' to the screen.

=end