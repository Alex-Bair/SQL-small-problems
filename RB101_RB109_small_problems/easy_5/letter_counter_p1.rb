=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: String with one or more space separated word
-  Output: Hash showing the number of words of different sizes. The key is the word size, the value is the number of words with that word size.

---

**Problem Domain:**
Words consiste of any string of characters that do not include a space.
---

**Implicit Requirements:**
- Hash keys should be sequenced as the word lengths appear in the string.
- Any non-space character is a part of a word (ex: word? is a 5 character long word)
- Empty strings should return an empty hash.
---

**Clarifying Questions:**

1. None, examples are clear.

---

**Mental Model:**
- Split words apart, delimiting by spaces.
- Count the number of characters in each word.
- Increment the corresponding hash key-value pair by 1 for each word's length.
- Return the hash.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

---

Data Structure
--------------

- Use arrays to contain the words. Use a hash to store the lengths and the number of occurences of each word length.

---

Algorithm
---------

- Split input string into an array1, delimiting by spaces.
- Initialize a hash1 with default value of 0.
- Iterate over the array1:
  - Increment the hash1 by 1 using the key of the word length.
- Return the hash1

Code
----

=end

def word_sizes(string)
  string.split(" ").each_with_object(Hash.new(0)) do |word, hsh|
    hsh[word.length] += 1
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}