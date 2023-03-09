=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a string representing an octal number
-  Output: decimal integer version of octal input string

---

**Problem Domain:**

Decimal is a base-10 system. It can be understood as a linear combination of powers of 10:

- Rightmost digits get multipled by 10^0
- Next digit gets multiplied by 10^1
- Next digit gets multipled by 10^2
...so on & so forth
- The nth digit gets multiplied by 10^(n-1)
- All of these values are then summed.


Octal numbers are similar, but they use base-8 instead of base-10.


What's an invalid octal number?
- Anything with alphabetic characters
- Anything with digits 8 or 9.

---

**Explicit Requirements:**
- Do not use any built-in or library methods to perform the necessary conversion.
- Treat invalid input as octal 0.
---


**Implicit Requirements:**
- Must have an Octal class.
- Must have a public Octal#to_decimal method to perform octal to demical conversion.
  - Takes a string as an input. Output is an integer.
- 
---

**Clarifying Questions:**

1. None right now.

---

**Mental Model:**

- Octal class
  - #initialize => assigns input string to instance variable @input_octal, also validates input prior to assignment
  - #to_decimal => converts an octal integer to a decimal integer
  - #valid_input? => checks if input octal string is a valid octal number, returns true or false
  - #convert_to_int => converts input octal string to an octal integer

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See octal_test.rb file for examples.

---

Data Structure
--------------

See Mental Model for details.

---

Algorithm
---------

#initialize
- assigns the input octal string to instance variable @input_str

#to_decimal
- Initialize local variable 'sum' to 0.
- Assign the return value of #convert_to_int to local variable 'octal_int'
- Iterate through the digits of 'octal_int' in reverse order, with the index.
  - Add the current digit to the power of the index to local variable 'sum'
- Return 'sum'

#valid_input?
- If the input string contains any characters that are not 0, 1, 2, 3, 4, 5, 6, 7, then return false.
- Otherwise, return true.

#convert_to_int
- Returns 0 if #valid_input? returns false.
- Otherwise, return @input_str converted to an integer.



Code
----

=end

class Octal
  def initialize(str)
    @input_str = str
  end

  def to_decimal
    octal_int = convert_to_int
    sum = 0

    octal_int.digits.each_with_index do |digit, index|
      sum += (digit * (8 ** index))
    end

    sum
  end

  private

  def valid_input?
    regex = /[^0-7]/
    
    !(@input_str =~ regex)
  end

  def convert_to_int
    return 0 unless valid_input?
    @input_str.to_i
  end
end