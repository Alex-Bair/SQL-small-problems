
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin

Each element in array1 is appended to array2. array2's elements are now all pointing to the same string objects as array1.
upcase! is called on the elements in array1 that start with 'C' or 'S'. 
array1 will now be ['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo']
array2 will also be ['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo'] since none of array2's elements have been reassigned to point to a different object.


This feature of Ruby can get us in trouble by causing confusion & unclear impacts on elements of collections when we mutate elements within a collection. 
We can avoid this by using reassignment (or just non-destructive methods) when creating elements in a new collection.

=end