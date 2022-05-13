def display_age(age, name)
  puts "#{name} is #{age} years old!"
end

puts "What's your name?"
name = gets.strip.chomp
name = "Teddy" if name.empty?
age = rand(20..200)

display_age(age, name)