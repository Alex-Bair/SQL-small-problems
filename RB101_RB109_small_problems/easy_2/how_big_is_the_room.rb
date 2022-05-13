SQFEET_TO_SQINCHES = 144
SQINCHES_TO_SQCENTIMETERS = 6.4516

puts "Enter the length of the room in feet: "
length_feet = gets.chomp.to_f
puts "Enter the width of the room in feet: "
width_feet = gets.chomp.to_f

area_feet = length_feet * width_feet
area_inches = area_feet * SQFEET_TO_SQINCHES
area_cm = area_inches * SQINCHES_TO_SQCENTIMETERS

puts "The are of the room is #{area_feet.round(2)} square feet (#{area_inches.round(2)} square inches or #{area_cm.round(2)} square centimeters.)."