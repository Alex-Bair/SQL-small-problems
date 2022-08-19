def meal
  return 'Breakfast'
  'Dinner'
end

puts meal

=begin

Breakfast will be printed to the screen. The meal method is defined on lines 1 - 4. On line 2, the string object 'Breakfast' is returned, and no other lines within the method are evaluated. This makes the meal method's return value 'Breakfast'.

On line 6, the puts method is invoked and the return value of meal ('Breakfast') is passed to the puts method as an argument.

=end