def get_num(order)
  puts "=> Enter the #{order} positive integer:"
  gets.chomp.to_i
end

def math(first_num, second_num, ops_array)
  ops_array.each do |op|
    total = first_num.send(op, second_num)
    puts "=> #{first_num} #{op} #{second_num} = #{total}"
  end
end

ops = %w(+ - * / % **)

first_num = get_num("first")
second_num = get_num("second")

math(first_num, second_num, ops)

#If we wanted to use floats instead of integers, we would need to validate inputs more closely, especially looking for leading and trailing zeros. We would also need to format the results using either #round or #format.