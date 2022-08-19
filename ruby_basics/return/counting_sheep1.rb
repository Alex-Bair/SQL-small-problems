def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

=begin

The above code will print:

0
1
2
3
4
5


The count_sheep method is defined on lines 1-5. 
On line 2, the times method is called on the integer 5 and passed in the block delimited by the do/end on lines 2-4.
The block parameter sheep is defined on line 2, and is assigned the values 0 through 4 from the times method.
The puts method on line 3 is passed the block parameter sheep, and this will print the assigned values 0 through 4.
The times method on line 2 will return the calling object (integer 5). This will be the return value of the count_sheep method.
On line 7, the puts method is invoked and passed in the return value of the count_sheep method (5). This will print 5 to the screen.




=end