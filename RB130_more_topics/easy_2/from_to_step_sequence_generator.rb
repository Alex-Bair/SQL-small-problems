def step(start_val, end_val, step_val)
  current_val = start_val
  
  until current_val > end_val
    yield(current_val)
    current_val += step_val
  end
  
  [start_val, end_val]
end

step(1, 10, 3) { |value| puts "value = #{value}" }

=begin
Since the Range#step method returns the original range, I think our #step method should return an array containing the original start value and end value.
This would align it with how the Range#step method behaves. The Range#step method returns the input that provides the upper and lower bounds for the iteration, so our #step method should also return the input that provides the upper and lower bounds for the iteration.


=end