=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string of some lowercased words and some non-alphabetic characters
-  Output: string with spaces replacing non-alphabetic characters. No consecutive spaces

---

**Problem Domain:**
- Non-alphabetic characters are those that are not contained within a-z or A-Z.
---

**Implicit Requirements:**
- Assuming no accented characters or alphabetic characters in any extended ASCII tables.
- All letters will be lowercase.
- No consecutive spaces.
- Character sequence is to be maintained.
---

**Clarifying Questions:**

1. Will there be any accented characters (ex: those in the extended ASCII tables)?
  - Assume no.
2. Should a different string object be returned from the input string?
  - Assume yes.

---

**Mental Model:**

- Split string apart into each character. 
- If alphabetical character, keep. 
- If non-alphabetical character, change to a space
- Reduce consecutive spaces to a single space
- Put string back together with spaces.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

cleanup("---what's my +*& line?") == ' what s my line '

---

Data Structure
--------------

Use arrays to contain characters.

---

Algorithm
---------

- Define constant of valid alphabetical characters.
- Split string into an array containing each character.
- Iterate through array of characters.
  - Do not modify characters that are in valid alphabetical characters constant.
  - Change characters not in valid alphabetical characters constant into spaces if previous character wasn't changed. If it was, then change current element into empty string.
    - If character is changed, set a flag to show that the previous character was changed.
- Combined modified array into string.

Code
----

=end

ALPHABETICAL_CHARACTERS = ('a'..'z').to_a

def cleanup(input_string)
  arr = input_string.chars.map do |char|
        unless ALPHABETICAL_CHARACTERS.include?(char)
            " "
        else
          char
        end
      end

  arr.join('').squeeze(" ")
end

cleanup(input)

#LS Regex Solution

def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end