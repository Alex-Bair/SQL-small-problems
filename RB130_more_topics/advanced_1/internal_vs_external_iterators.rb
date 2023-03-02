=begin

Website that helped me reach my solution

https://blog.carbonfive.com/enumerator-rubys-versatile-iterator/#:~:text=An%20Enumerator%20's%20external%20iteration,used%20to%20construct%20infinite%20lists.&text=An%20Enumerator%20will%20yield%20one,to%20the%20next%20yielded%20value.


=end


enum = Enumerator.new do |yielder|
  # Definitions
  yielder << 1 # 0!
  yielder << 1 # 1!
  
  #Setup prior to iteration loop
  iteration_num = 1
  value = 1
  
  loop do
    iteration_num += 1
    value *= iteration_num
    yielder << value
  end
end

7.times do |num|
  puts "#{num}! = #{enum.next}"
end

puts '----------'

3.times do |num|
  puts "#{num}! = #{enum.next}"
end

puts '----------'

enum.rewind

7.times do |num|
  puts "#{num}! = #{enum.next}"
end

# LS Solution

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

# External iterators

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end