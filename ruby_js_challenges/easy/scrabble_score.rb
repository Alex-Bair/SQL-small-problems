=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Write a program that computes the Scrabble score for a given word.

-  Inputs: a word
-  Output: an integer representing the cumulative score of the input word's letters

---

**Problem Domain:**

Letter scoring for Scrabble:
A E I O U L N R S T => 1
D G => 2
B C M P => 3
F H V W Y => 4
K => 5
J X => 8
Q Z => 10


A word's Scrabble score is the sum of its individual letter's scores.

---

**Explicit Requirements:**
- See Problem Domain.
---


**Implicit Requirements:**
- nil should return a score of 0
- whitespace should return a score of 0
- empty strings should return a score of 0
- scoring for words should be case insensitive
- A class method #score should also perform the same function as Scrabble#score
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

#initialize => initialize instance variable @word to a downcased string of the input

#score => sum up the score of the letters in @word, and return that score

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See examples in scrabble_score_test.rb

---

Data Structure
--------------

Use a hash to store the Scrabble scores for each letter. Have the keys be arrays of the letters and the values be the score for those letters.

SCRABBLE_SCORE = {
  %w(a e i o u l n r s t) => 1,
  %w(d g) => 2,
  %w(b c m p) => 3,
  %w(f h v w y) => 4,
  %w(k) => 5,
  %w(j x) => 8,
  %w(q z) => 10
}

---

Algorithm
---------

#score
- split @word into individual characters
- initialize local variable score to 0
- iterate over the individual characters
  - iterate over the SCRABBLE_SCORE hash constant
    - if the hash key includes the current character, increment the score by the hash value
- return score

Code
----

Two possible solutions provided below.

=end

# class Scrabble
#   SCRABBLE_SCORE = {
#     %w(a e i o u l n r s t) => 1,
#     %w(d g) => 2,
#     %w(b c m p) => 3,
#     %w(f h v w y) => 4,
#     %w(k) => 5,
#     %w(j x) => 8,
#     %w(q z) => 10
#   }
  
  
#   def initialize(input)
#     @word = input.to_s.downcase
#   end
  
#   def score
#     total = 0
    
#     @word.each_char do |letter|
#       SCRABBLE_SCORE.each do |letters_arr, value|
#         total += value if letters_arr.include?(letter)
#       end
#     end
    
#     total
#   end
  
#   def self.score(input)
#     Scrabble.new(input).score
#   end
# end


class Scrabble
  SCRABBLE_SCORE = {
    %w(a e i o u l n r s t) => 1,
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10
  }
  
  def initialize(input)
    @word = input.to_s.downcase
  end
  
  def score
    @word.chars.reduce(0) {|total, l| total + convert(l)}
  end
  
  def convert(letter)
    SCRABBLE_SCORE.each do |letters_arr, value|
      return value if letters_arr.include?(letter)
    end
    0
  end
  
  def self.score(input)
    Scrabble.new(input).score
  end
end
