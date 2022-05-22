count = 1

loop do
  type = count.odd? ? "odd" : "even"
  puts "#{count} is #{type}!"
  break if count >= 5
  count += 1
end