def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=begin
The SystemStackError means that the stack is too large and the program execution is halted because the stack is too large and we overflow the stack. This is happening because we've defined a recursive method #move without a condition (or base case) to stop the recursion. 
Currently, #move will continue to call itself endlessly. To stop this infinitely recursive loop, we must conditionally return before the recursive call on line 3. If we return when n == 0, this will stop the recursive #move calls when all items have been moved from one array to another.
=end

#Further Exploration
#If the length of `from_array` is smaller than `n`, then `nil` objects are appended to the `to_array`. The `nil` object come from calling `Array#shift` on `from_array` when it is empty. This can be fixed by adjusting the base case from `n == 0` to `n == 0 || from_array.empty?`

def move(n, from_array, to_array)
  return if n == 0 || from_array.empty?
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(4, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']