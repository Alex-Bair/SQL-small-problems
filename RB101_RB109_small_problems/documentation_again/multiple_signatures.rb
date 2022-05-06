a = %w(a b c d e)

#puts a.fetch(7) # Exception is raised.

puts a.fetch(7, 'beats me') # Prints beats me.

puts a.fetch(7) { |index| index**2 } # Prints 49.

