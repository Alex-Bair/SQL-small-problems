=begin
def multiples(num, start)
  multi_arr = []
  i = 1
  loop do
    factor = start * i
    break if factor > num
    if num % factor != num
      multi_arr << factor
    end
    i += 1
  end
  multi_arr
end

def multisum(num)
  factors = multiples(num, 3) + multiples(num, 5)
  factors.uniq.sum
end
=end

#Further Exploration
# Enumerable.inject could help by shortening the multisum logic considerably.
# The inject method is more succinct and clearer than my method above.

def multisum(num)
  (1..num).inject(0) do |sum, i|
    if i % 3 == 0 || i % 5 == 0 
      sum += i
    else
      sum += 0
    end
  end
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168