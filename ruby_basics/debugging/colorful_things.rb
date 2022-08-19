colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook', 'game']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i >= colors.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

=begin

There are one more colors than there are things. There are 8 colors and 7 things. Once line 12 tries to access things[7], things[7] returns nil since this is beyond the size of the things array.
nil cannot be converted into a string with String#+, which is why we get the TypeError.
I would fix this by adding one more thing, making the colors array and the things array the same size.

The break condition on line 9 also needs updated. When the counter i is the same as the colors array size (8), colors[8] will return nil since it is beyond the size of the colors array. 
The break condition should be once i is greater than or equal to the colors array size. This would appropriately break out of the loop once all of the colors array elements have been iterated through.

=end