name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin
The code above prints out:
BOB
BOB

This is because name and save name still point to the same location in physical memory where 'Bob' is stored. 
The #upcase! method mutates the caller, and actually changes the 'Bob' object to 'BOB'. This maintains the same object ID.
Since both name and save_name still reference the same object ID and were not reassigned, they both point to 'BOB' now.

=end