def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

=begin

The above code will print:
0
1
2
3
4
10

The count_sheep method is defined on lines 1-6.

The times method is called on the integer 5 and passed in the block delimited by the do/end on lines 2-4.
The block parameter is defined as sheep on line 2. The block body on line 3 invokes the puts method and passes in the block parameter sheep for each iteration.
This outputs 0-4 to the screen.

On line 5, the integer 10 is the last evaluated line of the method. This means that the count_sheep method's return value is the integer 10.

On line 8, the puts method is invoked and passed the return value of the count_sheep method (10) as an argument. This outputs 10 to the screen.

=end