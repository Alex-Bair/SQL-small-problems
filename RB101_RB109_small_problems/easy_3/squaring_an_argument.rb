def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def square_to_the_power(num, power)
  multiply(num, 1) ** power
end

p square_to_the_power(-2, 3)