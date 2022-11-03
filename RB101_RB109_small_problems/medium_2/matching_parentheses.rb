=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: boolean representing if all parentheses are properly balanced

Pattern: There should always be a '(' before any ')'.

---

**Problem Domain:**
Balanced parentheses must occur in matching '(' and ')' pairs.
---

**Explicit Requirements:**
- Must return a boolean true or false.
---


**Implicit Requirements:**
- Method should be named #balanced?
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Iterate through the characters in the string. Keep a counter starting at 0.
On each iteration, if the character is a '(', increment the counter by 1. 
If the character is a ')', decrement the counter by 1.
If the counter is ever below 0 or is not 0 after all iterations are complete, return false. 
  Otherwise, return true.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

---

Data Structure
--------------
No complex data structures.
---

Algorithm
---------

- Create a new string with only the '(' and ')' kept from the input string. Assign to variable 'parentheses_in_input'.
- Initialize variable 'counter' to 0.
- Iterate through the characters in 'parentheses_in_input'.
  - When the iteration's character is a '(', increase counter by 1.
  - When the iteration's character is a ')', decrease counter by 1.
  - If the counter is every negative, return false.
- If all iterations complete and the counter is not 0, return false.
- Else, return true.
  

Code
----

=end

def balanced?(str)
  str = str.dup
  str.delete('^()')
  parentheses_in_input = str.chars
  
  counter = 0
  
  parentheses_in_input.each do |parenthesis|
    case parenthesis
    when '(' then counter += 1
    when ')' then counter -= 1
    end
    return false if counter.negative?
  end
  return false if counter != 0
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

#LS_solution
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

#Further Exploration

def balanced?(string)
  parens = 0
  curly = 0
  square = 0
  single_quotation = 0
  double_quotation = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
    
    curly += 1 if char == '{'
    curly -= 1 if char == '}'
    break if curly < 0
    
    square += 1 if char == '['
    square -= 1 if char == ']'
    break if square < 0
    
    #Need to figure out how to track whether single and double quotations are mixed up. Ex: " I had a 'bad" bad' bad" supper "
    single_quotation += 1 if char = "'"
    double_quotation += 1 if char = '"'
    
  end

  parens.zero? && curly.zero? && square.zero? && single_quotation.even? & double_quotation.even?
end