=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: single string
-  Output: return word of next to last word in input string

---

**Problem Domain:**
Words are any sequence of non-blank characters.
---

**Implicit Requirements:**
- Can assume input string will always contain at least two words.
---

**Clarifying Questions:**

1. None, example makes requirements clear.

---

**Mental Model:**

Split string into array, delimiting by spaces.
Return second to last element in array to screen.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

---

Data Structure
--------------

- Use array to store data and access penultimate element.

---

Algorithm
---------

- Split input string into array of words.
- Return second to last element to the screen.

Code
----

=end

def penultimate(string)
  string.split(" ")[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

#Further Exploration
=begin
Edge cases that need considered if retrieving middle word of a phrase/sentence are:
- no words
  - output a blank string
- one word
  - output the single word
- even number of words
  - handle by returning "Even number of words - no middle word exists."
=end

def middle(string)
  words = string.split
  midpoint = words.length / 2
  if words.length == 0
    puts "No words found."
  elsif words.length.even?
    words[midpoint - 1] + " " + words[midpoint]
  else
    words[midpoint]
  end
end