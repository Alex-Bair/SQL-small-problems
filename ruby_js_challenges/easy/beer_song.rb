=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: one or more integers
-  Output: lyrics of the Beer Song for the verse specified by the input integer(s)

---

**Problem Domain:**

The Beer Song starts at 99 bottles, then counts down with each verse.
A single verse has two lines.

---

**Explicit Requirements:**
- See implicit requirements.
---


**Implicit Requirements:**
- Must have a class named BeerSong.
- Must have class methods:
  - #verse => takes a single integer input & returns the two lines associated with that integer input
  - #verses => takes two integer inputs & returns the two lines associated with those integer inputs
  - #lyrics => returns the entire Beer Song
- Each line must have a newline character \n at the end.
- Each verse must be separated by a newline character \n.
- Verse 0 has lyrics that differ from the rest of the song.
- Instead of 0 in the lyrics, we say "No more".
---

**Clarifying Questions:**

1. None right now.

---

**Mental Model:**

BeerSong class
- #verse => creates two lines (a single verse) of the beer song with the single input integer
- #verses => uses the #verse method to create the verses specified by the input integers
- #lyrics => uses the #verses method to generate the entire song.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See beer_song_test.rb for examples.

---

Data Structure
--------------

See Mental Model.

---

Algorithm
---------

#verse
- saves the input integer as 'num'
- saves 'num' - 1 as 'next_num'. If 'num - 1' is 0, save 'next_num' as "no more."
- When 'num' is zero, return a unique string.
- When 'num' is not zero, perform string interpolation 
  - has a string with the generic beer song verse lyrics with string interpolation where the numbers are
    - the first spot is 'num', the second spot is 'next_num'

#verses
- Initialize an empty string to local variable 'result'
- Create an array of integers from highest to lowest containing the range of integers between the two input integers.
- Iterate through the input integers. Call the block parameter current_num
  - Append the return value of #verse(current_num) to 'result'
  - Append a newline character to 'result'.
- Remove a single newline character from the end of 'result'.
- Return 'result'

#lyrics
- Call #verses(99, 0)

Code
----

=end

class BeerSong
  def self.verse(num)
    case num
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end
  
  def self.verses(num1, num2)
    results = ""
    
    nums = (num2..num1).to_a.reverse
    
    nums.each do |current_num|
      results << self.verse(current_num)
      results << "\n"
    end
    
    results.chomp
  end
  
  def self.lyrics
    self.verses(99, 0)
  end
end