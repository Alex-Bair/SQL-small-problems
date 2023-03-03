=begin

PEDAC Template
==============

(Understand the) Problem
------------------------



-  Inputs: a single string (word) and a list (array) of possible anagrams of the word
-  Output: an array containing the correct anagram(s) from the input list

---

**Problem Domain:**

Anagrams are words formed by rearranging the letters of a different word exactly once.

Qualities of an anagram:
- Case insensitive
- Exact same number of letters
- Use each letter from the source word exactly once
- Not the exact same word as the source word

---

**Explicit Requirements:**
- Program should return an array.
---


**Implicit Requirements:**
- A word is not an anagram of itself.
- Anagrams are case insensitive
- Anagrams must have the exact same number of letters, no more, no less.
- Anagrams use each letter from the input word exactly once.
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

#initialize => assigns single string argument to instance variable @word

#match => takes a single array argument and returns an array containing only the elements from the input array that are anagrams of @word

#anagram? => takes a single string argument and returns true if it is an anagram of @word

#sorted_downcased_characters => returns a string containing the same characters as the input, but all downcased and in alphabetical order

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See examples in anagrams_test.rb file

---

Data Structure
--------------

Use strings to contain the word.
Use an array to contain possible anagrams. 

---

Algorithm
---------

See Mental Model. 

Code
----

=end

class Anagram
  def initialize(input)
    @word = input.downcase
    @sorted_downcased_word = @word.chars.sort.join
  end
  
  def match(list)
    list.select {|possible_anagram| anagram?(possible_anagram)}
  end
  
  private
  
  def anagram?(w)
    @word != w.downcase && 
      @sorted_downcased_word == w.downcase.chars.sort.join
  end
end