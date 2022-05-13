puts "What is your age (in years)?"
current_age = gets.strip.chomp.to_i

puts "At what age (in years) would you like to retire?"
retirement_age = gets.strip.chomp.to_i

current_year = Time.now.year
working_years_left = retirement_age - current_age
retirement_year = current_year + working_years_left

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You only have #{working_years_left} years of work to go!"