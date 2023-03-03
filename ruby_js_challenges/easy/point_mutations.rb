=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Calculate the Hamming distance between two DNA strands (input as strings)
Create a DNA class with public methods #initialize and #hamming_distance

#hamming_distance
-  Inputs: one string representing a separate sequence
-  Output: integer representing hamming distance between calling DNA object's sequence and the string argument

---

**Problem Domain:**

The Hamming distance is the count of how many point mutations exist between two sequences of equal length.
If sequences of unequal length are compared, the Hamming distance should be computed over the shorter length.


---

**Explicit Requirements:**
- If the Hamming distance is compared for sequences of unequal length, compute Hamming distance over the shorter length
---


**Implicit Requirements:**
- Create a DNA class with:
  - #initialize that takes a single argument representing the DNA strand's sequence
  - #hamming_distance that takes a single argument representing the sequence to compare against & calculate the Hamming distance

- #hamming_distance should not mutate objects
- #hamming_distance should return a number

---

**Clarifying Questions:**

1. WIll the input strings always be capital letters? i.e. I don't need to validate input?
- Yes, assume the input is always a valid sequence of capital letters.

---

**Mental Model:**

#initialize => initalize instance variable @sequence to the passed in string argument
#hammming_distance => calculate the hamming distance between the passed in string argument and @sequence

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See provided test cases in point_mutations_test.rb

The Hamming distance between these two DNA strands is 7.
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

---

Data Structure
--------------

Keep the sequences as String objects.
Use Ruby standard methods #each_char and #with_index to iterate and compare the sequences against each other.

---

Algorithm
---------

#initialize
- initialize instance variable @sequence to the input string

#hamming_distance.
- Initialize local variable distance to 0.
- Create an array containing @sequence and the input string.
- Destructively sort the array by the size of the strings.
- Iterate through the first string in the array. This will be the shorter of the two strings (if not the same length). Pass in each character and it's index into the block
  - Compare the current character with the character in the same index of the longer sequence. If they are not the same, increment local variable distance by 1.
- Return local variable distance.

Code
----

=end

class DNA
  def initialize(seq)
    @sequence = seq
  end
  
  def hamming_distance(other_sequence)
    distance = 0
    short, long = [@sequence, other_sequence].sort_by! {|str| str.size}
    
    short.each_char.with_index do |short_ch, index|
      distance += 1 unless short_ch == long[index]
    end
    
    distance
  end
end


#JDF's Solution

class DNA
  def initialize(seq)
    @seq = seq
  end

  def hamming_distance(other_seq)
    short, large = [@seq, other_seq].sort_by(&:size)
    (0...short.size).count { |idx| short[idx] != large[idx] }
  end    
end