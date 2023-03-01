# Simple solution

def count(*num_array)
  c = 0
  
  num_array.each do |num|
    c += 1 if yield(num)
  end
  
  c
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3

# Refactored solution using Enumerable#inject and providing behavior for when a block is not provided to mimic Enumerable#count

def count(*num_array)
  if block_given?
    num_array.inject(0) { |c, num| yield(num) ? c + 1 : c }
  else
    num_array.size
  end
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
p count() == 0