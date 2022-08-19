def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

=begin

The above code will print:

0
1
2
nil

The count_sheep method is defined on lines 1-8.
The times method is called on the integer 5 and passed in the block delimited by the do/end on lines 2-7.
The block parameter is defined as sheep on line 2.
The puts method is invoked on line 3 and passed in the block parameter sheep.
On lines 4-6, and if statement will execute if the block parameter sheep is 2 or greater. The if statement only contains a return keywork on line 5, which would immediately exit the times method upon execution.
Considering the above, the times method will iterate three times, printing 0, 1, 2. The if statement on lines 4-6 will execute after 2 is printed, exiting the times method and returning nil. This will make the count_sheep method's return value nil.

On line 10, the p method is invoked and passed in the count_sheep method's return value (nil). nil will be printed to the screen.

=end