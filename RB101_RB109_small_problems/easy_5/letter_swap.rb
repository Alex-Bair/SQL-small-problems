=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string of words separated by spaces
-  Output: input string where the first and last letter of each word is swapped with each other.

---

**Problem Domain:**
- Swapping means only the first and last letter within a given word is swapped. 
---

**Implicit Requirements:**
- Assume every word contains at least one letter.
- Assume string will always contain at least one word.
- Assume each string contains nothing but words and spaces.
- Word sequence is to be maintained.
---

**Clarifying Questions:**

1. If the string has multiple spaces between words, are those to be maintained?
  - Assume no. Multiple spaces should be reduced to a single space.
2.If the string begins or ends with a space, should those spaces be maintained in the result?
  - Assume no. Remove leading or trailing whitespace.

---

**Mental Model:**
- Split string into separate words delimited by spaces.
- Swap the first letter with the last letter for each word.
  - Move the first letter to the last position.
  - Reassign the now penultimate letter to the first position.
  - Repeat for each word.
- Concatenate the words together with a space in between each word.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

---

Data Structure
--------------
- Use arrays to contain each word and modify the words.
---

Algorithm
---------

- Split string into separate words in an array, delimiting by spaces.
- Iterate over the array for each word.
  - Move the first letter to the last position.
  - Reassign the now penultimate letter to the first position.
  - Remove the penultimate letter.
  - Repeat for each word.
- Concatenate the array together with a space in between each word.

Code
----

=end

def swap(input)
  words = input.split
  words.map do |word|
    word << word[0]
    word[0] = word[-2]
    word.slice!(-2)
    word
  end
  words.join(" ")
end

#Further Exploration

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

=begin
Using the below implementation instead of the above would not work. 
We must pass a reference to the actual word, not just the individual letters of the word.
Passing in a reference to the actual word lets us update it in the swap_first_last_characters method,
whereas just passing in the individual letters will only result in variable reassignment within the method.
=end

def swap_first_last_characters(a, b)
  a, b = b, a
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word[0], word[-1])
  end
  result.join(' ')
end