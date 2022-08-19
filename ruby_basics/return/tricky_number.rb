def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number

=begin

The above code will print:

1

The tricky_number method is defined on lines 1-7. An if-else statement on lines 2-6 will always evaluate the if clause since the conditional is the true object. The else clause will never be evaluated.

The if clause of the if-else statement initializes the local method variable number to the integer 1. The return value of this initialization is the integer 1. 
No other code is executed in the tricky_number method, making the return value of the tricky_number method 1.

On line 9, the puts method is invoked and passed in the tricky_number method's return value (integer 1) as an argument. This prints 1 to the screen and returns nil.


=end