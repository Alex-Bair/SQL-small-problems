def consonant?(character)
  !character.count("a-z", "^aeiou").zero?
end

def double_consonants(input_string)
  doubled_characters = ""
  input_string.each_char do |char|
    case consonant?(char.downcase)
    when true 
      doubled_characters << (char * 2)
    when false
      doubled_characters << char
    end
  end
  p doubled_characters
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""