def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

#On line 3, we are iterating over the array `words`. However, during the iteration, we destructively mutate the `words` array on line 4 with the `Array#delete` method call. This causes the iteration to skip over elements as their indices are changed by the destructive `Array#delete` call.
#To resolve this bug, we can create a dummy array for iteration that will not be affected by the destructive `Array#delete` call on the `words` array.

def neutralize(sentence)
  words = sentence.split(' ')
  dummy_words = words.dup
  dummy_words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')