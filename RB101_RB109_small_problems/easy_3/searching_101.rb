SIZE_FOR_ARRAY = 5

def suffix(num)
  case num
  when 1
    "st"
  when 2
    "nd"
  when 3
    "rd"
  else
    "th"
  end
end

arr = []


for i in 1..SIZE_FOR_ARRAY do
  puts "=> Enter the #{i}#{suffix(i)} number:"
  arr << gets.chomp.to_i
end

puts "=> Enter the last number:"
final_num = gets.chomp.to_i

check = arr.include?(final_num)
appears_or_not = check ? "appears" : "does not appear"

puts "The number #{final_num} #{appears_or_not} in #{arr}."