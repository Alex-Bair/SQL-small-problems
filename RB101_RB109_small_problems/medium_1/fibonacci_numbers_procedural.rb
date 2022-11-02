=begin
Rewrite previous fibonnaci recursive method to use procedural methods (non-recursive).

Previous exercise's solution:

def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

Fibonacci sequence: 
1 1 2 3 5 8 13 etc....

Algorithm:



=end

def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, first + last]
  end

  last
end