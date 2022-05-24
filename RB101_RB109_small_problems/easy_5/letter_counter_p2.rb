ALPHABET = ("a".."z").to_a + ('A'..'Z').to_a

def word_sizes(string)
  string.split(" ").each_with_object(Hash.new(0)) do |word, hsh|
    modified_word = word.chars.select {|letter| ALPHABET.include?(letter)}.join("")
    hsh[modified_word.length] += 1
  end
end

#Alternative using String#delete

def word_sizes(string)
  string.split(" ").each_with_object(Hash.new(0)) do |word, hsh|
    word.delete!('^A-Za-z')
    hsh[word.length] += 1
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}