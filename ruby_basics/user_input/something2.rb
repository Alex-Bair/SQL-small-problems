loop do
  puts ">> Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase
  case answer
  when 'y'
    puts ">> something"
    break
  when 'n'
    break
  end
  puts ">> Invalid input! Please enter y or n"
end