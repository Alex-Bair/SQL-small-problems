puts "Greetings. What is your name?"
name = gets.strip.chomp.capitalize

if name.end_with?("!")
  name.upcase!.chop!
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# Further exploration

print 'What is your name? '
name = gets.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end