def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp

puts "The result is #{multiply_by_five(number)}!"

=begin

On line 6, the program gets input from the user and stores that string input into the local variable number.
On line 8, string interpolation is used to output to the screen. The multiply_by_five method is passed the string argument via local variable number, and the method performs String#*.
In order to perform Integer#*, the local variable number needs to be converted from a String to an Integer before the code on line 2 is executed within the multiply_by_five method.
Using the String#to_i method on line 6 can resolve this issue.

=end