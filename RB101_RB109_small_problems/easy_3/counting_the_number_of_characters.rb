print "Please write a word or multiple words: "
string = gets.chomp
char_count_no_spaces = string.length - string.count(" ")
puts "There are #{char_count_no_spaces} characters in \"#{string}\"."