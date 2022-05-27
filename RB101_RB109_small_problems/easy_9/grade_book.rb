=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: three number between 0 and 100
-  Output: letter grade for the mean of the three scores

---

**Problem Domain:**

Mean is the average (sum of all numbers divided by count of number)

---

**Implicit Requirements:**

- Return value must be a capital letter corresponding to the mean of the three scores
- Input values will always be between 0 and 100.
  - Do not check for negative values or values greater than 100.
- Letter grades are:
  "A" is 90 <= score <= 100
  "B" is 80 <= score < 90
  "C" is 70 <= score < 80
  "D" is 60 <= score < 70
  "F" is 0 <= score < 60

---

**Clarifying Questions:**

1. Will the input numbers ever have decimals (e.g. could they be floats?)
  - Yes, floats are possible.

---

**Mental Model:**

- Calculate mean of the three input numbers ( divide by 3.0)
- Check which letter grade corresponds to the mean, starting with the highest grade to the lowest.
- Return the letter grade

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

---

Data Structure
--------------

- Use integers and floats for calculations and comparisons.

---

Algorithm
---------

- Calculate mean of the three input numbers (divide sum by 3.0)
- Check which letter grade corresponds to the mean, starting with the highest grade to the lowest.
- Return the letter grade

Code
----

=end

def get_grade(score1, score2, score3)
  mean = (score1 + score2 + score3) / 3.0
  case
  when mean >= 90 then "A"
  when mean >= 80 then "B"
  when mean >= 70 then "C"
  when mean >= 60 then "D"
  else                 "F"
  end  
end

#LS Solution
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

#Further Exploration
#My solution handles if extra credit could cause a grade to exceed 100 points since it just checks if the mean is greater or equal to 90, not a set range. Or you could adjust the A case in the LS solution to have an endless range (90..)