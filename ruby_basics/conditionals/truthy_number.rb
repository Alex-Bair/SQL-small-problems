number = 7

if number
  puts "My favorite number is #{number}."
else
  puts "I don't have a favorite number."
end

=begin

The above code will print:

My favorite number is 7.

On line 1, the local variable number is initialized to the integer object 7.

On lines 3-7, an if-else statement controls the flow of evaluation based on the truthiness of the local variable number.

Since local variable number is initialized to the integer 7 (which is not false or nil), Ruby considers the local varible number to be truthy in the conditional on line 3. This means the if clause will always be evaluated and the else clause will be ignored.

On line 4, the puts method is invoked and passed in the string object "My favorite number is #{number}." The #{number} is string interpolation and will convert the value of the local variable number (integer 7) to a string and insert it into the string object. The puts method invocation will output the interpoated string to the screen.

=end