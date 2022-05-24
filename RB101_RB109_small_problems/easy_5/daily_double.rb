=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string
-  Output: string with any consecutive duplicate characters replaced with just a single character

---

**Problem Domain:**

---

**Implicit Requirements:**
- May not use String#squeeze or String#squeeze!
- Only consecutive duplicate characters should be collapsed. Non-consecutive duplicate characters should be un-altered.
- Empty string shold return an empty string.
---

**Clarifying Questions:**

1. Should the method return a new string object, or the same string object?
  - New string object.
2. Should consecutive spaces be collapsed?
  - Yes

---

**Mental Model:**

- Replace the consecutive duplicate characters with empty strings.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

---

Data Structure
--------------

- Use arrays to contain each character.

---

Algorithm
---------

- Create an empty string1
- Split the input string into an array1 with each character as an element.
- Iterate over the array1:
  - If the array1 element is not the most recent character in string1, append the element to string1
- Return string1.

Code
----

=end

def crunch(input)
  input.chars.each_with_object('') do |char, crunched_string|
    unless char == crunched_string[-1]
      crunched_string << char
    end
  end
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

#Further Exploration

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  p crunch_text
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'

=begin

In the solution above, we want the last iteration to compare to text[index+1] past the end of the string so that the last character is added. If we do not do this comparison, the last non-consecutive duplicate character of the string won't be added to crunch_text.

If we stop iterating when index = text.length, we get the same result as before.

I think the LS solution did not use String#each_char or String#chars in order to avoid using an array at all in the solution. See my solution for an example of using String#chars to solve the problem.

=end


#Regex Attempt - not attempted yet.
