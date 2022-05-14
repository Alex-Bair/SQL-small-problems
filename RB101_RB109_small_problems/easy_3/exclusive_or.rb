def xor?(arg1, arg2)
  !!((!arg1 && arg2) || (arg1 && !arg2))
end

=begin
The boolean #xor method would be useful when you only want ONE condition to be true. Examples include: 
- only allowing a single door to be opened at a time into an airlock
- only allowing a single person to edit a shared document/file at a time

The #xor method DOES perform short-circuit evaluation of it's operands. The second to last evaluation is an OR operation, which will short-circuit if the first operand is true. 
However, short-circuit evaluation in OR operations is ok since if the first operand is true, the second operand will always be false.

=end