=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: string representing time in hh:mm format
-  Output: integer representing minutes before or after midnight (depending on which method is called). Valid integers are betwee 0..1439.

---

**Problem Domain:**
hh:mm format represents time. 
---

**Implicit Requirements:**
- Midnight can be represented by "00:00" and "24:00"
---

**Clarifying Questions:**

1. None, examples make it clear. Assuming no input validation needed.

---

**Mental Model:**

Convert the input string into separate varables representing hours and minutes.
Convert hours into minutes, add to minutes variable

after_midnight method:
  return minutes
  
before_midnight method:
  subtract minutes from 1440
  return result of subtraction


---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

---

Data Structure
--------------

Use strings for input. Convert to integers for mathematical operations.

---

Algorithm
---------

- Deliminate input string by colon (:). Convert to integers and save as hours and minutes.
- Multiple hours by 60 and add to minutes.
- If after_midnight method, return minutes % 1440
- If before midnight method:
  - subtract minutes from 1440
  - return result of subtraction % 1440
Code
----

=end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def convert_time_to_minutes(string)
  hours, minutes = string.split(":")
  minutes = minutes.to_i + (hours.to_i * MINUTES_PER_HOUR)
end

def after_midnight(string)
  convert_time_to_minutes(string) % MINUTES_PER_DAY
end

def before_midnight(string)
  (MINUTES_PER_DAY - convert_time_to_minutes(string)) % MINUTES_PER_DAY
end


#Further Exploration

def after_midnight(time) 
  hours, mins = time.split(':').map(&:to_i)
  hours = hours % 24
  time1, time2 = Time.new(0), Time.new(0, 1, 1, hours, mins)
  (time2.to_i - time1.to_i) / 60
end

def before_midnight(time)
  after_midnight(time) == 0 ? 0 : 1440 - after_midnight(time)
end