=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: Integer representation of # of minutes from midnight. Positive means after midnight, negative means before midnight.
-  Output: String representation of time in the 24 hour format.

---

**Problem Domain:**
24 hour format is hh:mm.
There are 60 minutes in an hour.

---

**Implicit Requirements:**
- Any integer input is valid. Even more minutes than are in a day is a valid input.
- Disregard Daylight Savings and Standard Time and other complications.
- May not use the Date or Time class.

---

**Clarifying Questions:**

1. None, examples make it clear.

---

**Mental Model:**

- Determine whether to add or subtract from midnight based on the sign of the input integer.
- Determine how many hours (60 minute chunks) are in the input.
  - Disregard blocks of 24 hours (a single day)
- Add hours to 0 / subtract hours from 24. Convert to string with leading zero if necessary
- Add minutes to 0 / subtract minutes from 60. Convert to string with leading zero if necessary
- Concatenate hours and minutes with a colon (:)


---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

---

Data Structure
--------------

Use integers to perform calculations.
Use strings to contain string representations of hours and minutes.
Use constants to hold midnight hours and minutes.

---

Algorithm
---------

- Set midnight constants.
- Determine if input is negative. Set to a boolean variable (before_midnight?).
- Determine hours and minutes within input integer.
  - Divide absolute value of input integer by 60 to get the number of hours (result) and the number of minutes (remainder).
    - Get modulus of result % 24. Replace number of hours with result % 24.
- Store result of following if statement as a variable (time_arr)
  - If before_midnight? is true
    - If minutes is zero, add 60 minutes and subtract one hour.
    - Subtract hours and minutes from [24, 60].
  - Else
    - Add hours and minutes to [0, 0]
- Format time_arr elements to strings with leading zeros.
- Concatenate time_arr elements with a colon (:)
- Return concatenation.



Code
----

=end

BEFORE_MIDNIGHT = [23, 60]
AFTER_MIDNIGHT = [0, 0]

def time_of_day(input)
  before_midnight = input.negative?
  time_from_midnight = input.abs.divmod(60)
  hours_from_midnight = time_from_midnight[0] % 24
  minutes_from_midnight = time_from_midnight[1] 
  
  if before_midnight
    if minutes_from_midnight == 0
      minutes_from_midnight = 60
      hours_from_midnight -= 1
    end
    hours = BEFORE_MIDNIGHT[0] - hours_from_midnight
    minutes = BEFORE_MIDNIGHT[1] - minutes_from_midnight 
  else
    hours = AFTER_MIDNIGHT[0] + hours_from_midnight
    minutes = AFTER_MIDNIGHT[1] + minutes_from_midnight
  end
  
  "#{format('%02d', hours)}:#{format('%02d', minutes)}"
end

#LS Solution

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

# Further Exploration
#Problem 1 - Unsure on solution. Potentially close solution by Jess Goodlett.

def time_of_day(num)
  hours, minutes = num.divmod(60)
  hours %= 24
  format('%02d:%02d', hours, minutes)
end

#Problem 2 & 3
def time_of_day(total_minutes)
  (Time.new(0, 1, 2) + (total_minutes * 60)).strftime("%A %H:%M")
end