=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string of digits AND  an integer representing a length of consecutive numbers
-  Output: an array containing arrays of all the possible consecutive number series with input length of the input string

---

**Problem Domain:**


---

**Explicit Requirements:**
- Inputs are:
  - a string of numeric digits
  - an integer representing the length of the desired consecutive number series
- If the input length is greater than the length of the input string, throw an ArgumentError.
---


**Implicit Requirements:**
- Must have a custom Series class.
  - Must have an #initialize method that takes a single string argument.
  - Must have a #slices method that returns an array containing arrays of the desired sequences
---

**Clarifying Questions:**

1. Should we assume the input string is always a valid string of digits?
  Yes.
---

**Mental Model:**

#initialize => initialize instance variable @input_string to the passed in string
#slices => iterate over @input_string's characters and build an array containing arrays of the appropriate sequences
#valid_length? => returns true if the input length integer is less than or equal to the length of @input_string


---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See series_test.rb for examples and test cases.

---

Data Structure
--------------

Series class
  #initialize => initializes @input_string
  #slices
  #valid_length?

---

Algorithm
---------

#valid_length?(input_length)
- Returns false if the input length is greater than the length of @input_string. Return true otherwise.

#slices(input_length)
- Raises an ArgumentError unless #valid_length?(input_length) returns true
- Initializes local variable 'results' to an empty array.
- Split @input_string into an array of characters. Assign to local variable 'input_chars'
- Iterate over 'input_chars', passing an array of the specified consecutive elements into a block. Call the block parameter 'cons_arr'.
  - Convert 'cons_arr' to an array of integers.
  - Append 'cons_arr' to 'results'
- Return 'results'

Code
----

=end

class Series
  def initialize(input)
    @input_string = input
  end
  
  def slices(length)
    raise ArgumentError unless valid_length?(length)
    
    results = []
    input_chars = @input_string.chars
    
    input_chars.each_cons(length) do |cons_arr|
      cons_arr.map!(&:to_i)
      results << cons_arr
    end
    
    results
  end
  
  private
  
  def valid_length?(length)
    length <= @input_string.length
  end
end