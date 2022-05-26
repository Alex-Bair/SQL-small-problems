=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string argument
-  Output: new string with the first character of each word capitalized and every other letter lowercase.

---

**Problem Domain:**
Words are any sequence of non-blank characters.
---

**Implicit Requirements:**
- Assume words are any sequence of non-blank characters.
- Returned string should be a new separate object from the input string object.
---

**Clarifying Questions:**

1. None - examples make requirements clear.

---

**Mental Model:**

Split string into words, delimiting by spaces. Capitalize each word. Rejoin the words together with spaces between.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

---

Data Structure
--------------

- Use arrays to store words.

---

Algorithm
---------

- Split string into an array1 of words, delimiting by spaces.
- Iterate over array1, capitalizing each word.
- Rejoin the words together with spaces.

Code
----

=end

def word_cap(input_string)
  input_string.split(" ").map(&:capitalize).join(" ")
end



#Further Exploration

def capitalize_1(string)
  letters = []
  string.chars.each_with_index do |letter, index|
    case index
    when 0
      letters << letter.upcase
    else
      letters << letter.downcase
    end
  end
  letters.join("")
end

def word_cap(input_string)
  input_string.split(" ").map {|word| capitalize_1(word)}.join(" ")
end

def capitalize_2(string)
  string.length.times do |index|
    if index == 0
      string[index] = string[index].upcase
    else
      string[index] = string[index].downcase
    end
  end
  string
end

def word_cap(input_string)
  input_string.split(" ").map {|word| capitalize_2(word)}.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'