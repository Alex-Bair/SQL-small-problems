=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: integer representing a year
-  Output: integer representing the number of Friday the 13ths in the given year

---

**Problem Domain:**

A new Date object can be created with:
Date.new(yyyy, mm, dd)

A Date can be checked if it's a friday with Date#friday?

---

**Explicit Requirements:**
- Assume the year is greater than 1752 (when the UK adopted the modern Gregorian Calendar) and the modern Gregorian Calendar will remain in use for the foreseeable future.
---


**Implicit Requirements:**
- Method should be named #friday_13th
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**
Keep a counter of how many Friday the 13ths exist in the year.
Iterate from 1 to 12 (number of months in the year). In each iteration, create a Date class with the year argument, the month iteration, and the 13th day of the month. Check if the date is a Friday. If so, increment the counter by 1.
Return the counter.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

---

Data Structure
--------------

---

Algorithm
---------

Code
----

=end

require 'date'

def friday_13th(year)
  count = 0
  1.upto(12) do |month|
    thirteenth = Date.new(year, month, 13)
    count += 1 if thirteenth.friday?
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

#Further Exploration
#Count the number of months that have five Fridays

def months_with_five_fridays(year)
  month_count = 0
  current_month = 1
  loop do
    date = Date.new(year, current_month, 1)
    friday_count = 0
    loop do
      friday_count += 1 if date.friday?
      date = date.next_day
      break if current_month != date.mon
    end
    month_count += 1 if friday_count >= 5
    current_month += 1
    break if current_month > 12
  end
  month_count
end

p months_with_five_fridays(2027)