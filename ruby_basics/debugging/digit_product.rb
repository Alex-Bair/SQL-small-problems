def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')
# expected return value: 120
# actual return value: 0

=begin

On line 3, local method variable product is initialized to 0. Anything multipled by 0 is still 0. This means that on line 6, where local method variable product is reassigned to product times each digit, the product will always be 0.
This can be fixed by initializing local method variable product to 1 instead of 0 on line 3.

=end