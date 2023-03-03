=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Write code that converts modern decimal numbers into their Roman number equivalents.
Create a RomanNumeral class that takes a single integer argument.

RomanNumberal#to_roman:
-  Inputs: single integer
-  Output: string representing the corresponding roman numeral for the input integer
---

**Problem Domain:**

Modern Roman numerals are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

Roman numerals use letters to represent numbers:.

I => 1
V => 5
X => 10
L => 50
C => 100
D => 500
M => 1000

A symbol placed after another of equal or greater value adds its value:
II = 1 + 1 = 2
LVII = 50 + 5 + 1 + 1 - 57

Only three identical symbols can be used consecutively. To express number beginning with a 4 or a 9, a symbol is placed before one of greater value ot subtract its value:
IV = -1 + 5 = 4
XC = -10 + 100 = 90
CD = -100 + 500 = 400

---

**Explicit Requirements:**
- Do not need to worry about converting numbers larger than 3000.
---


**Implicit Requirements:**
- See Problem Domain
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

#initialize => takes a single integer argument and assigned to instance variable @number

#to_roman => converts value referenced by @number to a string representing the appropriate roman numeral
- Initialize local variable result to an empty array.
- Split @number into an array of digits in reverse order. The first element will be the ones place, second the tens place, third the hundreds place, and fourth the thousands place. Assign to local variable digits.
- Determine the size of the digits array. Assign to local variable num_of_digits.
- Iterate num_of_digits times
  - On first iteration, convert first element of digits using the #convert_ones method. Append to the result array.
  - On second iteration, convert second element of digits using the #convert_tens method. Append to the result array.
  - On third iteration, convert third element of digits using the #convert_hundreds method. Append to the result array.
  - On fourth iteration, convert fourth element of digits using the #convert_thousands method. Append to the result array.
- Reverse the result array and join its elements with no delimiter.  

#convert_ones => takes a single argument and returns ones place roman numeral representation of input
#convert_tens => takes a single argument and returns tens place roman numeral representation of input
#convert_hundreds => takes a single argument and returns hundreds place roman numeral representation of input
#convert_thousands => takes a single argument and returns thousands place roman numeral representation of input

The above four methods will leverage the #general_convert method below and pass in the appropriate values from the defined Hash constant.


#general_convert => takes four arguments -- 1. the input number to convert  2. the lower roman numeral for the digit  3. the middle roman numeral for the digit  4. the high roman numeral for the digit
- Initialize an empty string. Assign to local variable result.
- Iteration the same number of times as the input. Append the basic Roman numeral to result on each iteration.
- If the input is 4, remove the last 3 characters of the result string and append the middle Roman numeral.
- If the input is 9, remove the last 8 character of the result string and append the high Roman numeral.
- If the input is greater than five, remove the first five characters of the string and prepend the middle Roman numeral.
- Return result.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

 1  => I
 2  => II
 3  => III
 4  => IV
 5  => V
 6  => VI
 7  => VII
 8  => VIII
 9  => IX

10  => X
20  => XX
30  => XXX
40  => XL
50  => L
60  => LX
70  => LXX
80  => LXXX
90  => XC

1000 = M
900   = CM
90   = XC
1990 = MCMXC

2000 = MM
8    = VIII
2008 = MMVIII
---

Data Structure
--------------

Use an array to contain the digits of the input integer in reverse order.
Ex: 2541 => [1, 4, 5, 2]

Use a Hash constant to store standard Roman numerals

1 => I
5 => V
10 => X
50 => L
100 => C
500 => D
1000 => M

---

Algorithm
---------

See Mental Model.

Code
----

=end

class RomanNumeral
  ROMAN_NUMERALS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }
  
  def initialize(num)
    @number = num
  end
  
  def to_roman
    result = []
    
    digits = @number.digits
    
    num_of_digits = digits.size
    
    num_of_digits.times do |iteration_num|
      case iteration_num
      when 0 then result << convert_ones(digits[0])
      when 1 then result << convert_tens(digits[1])
      when 2 then result << convert_hundreds(digits[2])
      when 3 then result << convert_thousands(digits[3])
      end
    end
    
    result.reverse.join
  end
  
  private
  
  def convert_ones(num)
    general_convert(num, ROMAN_NUMERALS[1], ROMAN_NUMERALS[5], ROMAN_NUMERALS[10])
  end
  
  def convert_tens(num)
    general_convert(num, ROMAN_NUMERALS[10], ROMAN_NUMERALS[50], ROMAN_NUMERALS[100])
  end
  
  def convert_hundreds(num)
    general_convert(num, ROMAN_NUMERALS[100], ROMAN_NUMERALS[500], ROMAN_NUMERALS[1000])
  end
  
  def convert_thousands(num)
    result = ''
    
    num.times {result << ROMAN_NUMERALS[1000]}
    
    result
  end
  
  def general_convert(num, low_r, middle_r, high_r)
    result = ''
    
     case num
     when 4
      result << (low_r + middle_r)
      num = 0
     when (5..8)
      result << middle_r
      num = num - 5
     when 9
      result << (low_r + high_r)
      num = 0
     end
     
     num.times {result << low_r}
    
    result
  end
end