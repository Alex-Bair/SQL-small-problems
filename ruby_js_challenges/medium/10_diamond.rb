=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a string uppercase letter
-  Output: return a diamond shape using letters A - the input letter to build the diamond

---

**Problem Domain:**

---

**Explicit Requirements:**
- The first and last row contains one 'A'.
- All rows, except the first and last, have exactly two identical letters.
- The diamond is horizntally symmetric.
- The diamond is vertically symmetric.
- The diamond's width equals its height.
- The letters form a diamond shape
- The top half has the letters in ascending order.
- The bottom half has the letters in descending order
- The four corners (contianing the spaces) are triangles.
---


**Implicit Requirements:**
- Must have a custom Diamond class.
  - Must have a class method #make_diamond
- Each line must end in a newline character \n.
- The diamond must be returned, NOT output to the screen.
---

**Clarifying Questions:**

1. None right now.

---

**Mental Model:**

Diamond class => contains constant "START_LETTER" pointing to string "A" and "START_ORD" pointing to the ordinal of START_LETTER

#make_diamond => 
- Determines maximum line width.
- iterates through the letters from START_LETTER to the input letter. 
  - Passes each letter and the max line width to #build_line. 
  - Collects lines in an empty array assigned to a local variable 'top_half'
- Initializes local variable 'dia' to 'top_half' plus 'top_half' reverses (minus the last line)
- Combines 'dia' with no delimiter.

#build_line => creates a line with the appropriate letter and the appropriate length. Line ends in a newline character.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See diamond_test.rb for examples and test cases.

---

Data Structure
--------------

Diamond class
  - #make_diamond class method
  - #build_line class method
  
Use an array to contain the lines. Must join the lines together before returning then.

---

Algorithm
---------

#build_line
- Inputs: a letter and a number
- Initialize local variable 'length' to the (input letter's ordinal - (START_ORD - 1)) * 2 - 1
- Initialize local variable 'line' to a string of spaces with size of 'length'
- Convert the first and last characters in 'line' to the input letter.
- Center 'line' into a string size of the input number. Pad with spaces.
- Append a newline character to 'line'.
- Return 'line'.

#make_diamond
- Determines maximum line width. 
- iterates through the letters from START_LETTER to the input letter. 
  - Passes each letter and the max line width to #build_line. 
  - Collects lines in an empty array assigned to a local variable 'top_half'
- Initializes local variable 'dia' to 'top_half' plus 'top_half' reverses (minus the last line)
- Combines 'dia' with no delimiter.


Code
----

=end

class Diamond
  START_LETTER = 'A'

  def self.make_diamond(letter)
    width = (letter.ord - START_LETTER.ord) * 2 + 1
    letters = (START_LETTER..letter).to_a
    top_half = []

    letters.each do |letter|
      top_half << build_line(letter, width)
    end

    dia = top_half + top_half[0..-2].reverse
    dia.join('')
  end

  class << self
    private

    def build_line(letter, num)
      length = ((letter.ord - (START_LETTER.ord - 1)) * 2) - 1
      line = ' ' * length
      line[0], line [-1] = [letter, letter]
      line.center(num) << "\n"
    end
  end
end