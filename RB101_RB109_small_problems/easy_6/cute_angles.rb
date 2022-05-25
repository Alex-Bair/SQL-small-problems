=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: float number representing angle between 0 - 360 degrees
-  Output: string representing the input angle in degrees, minutes, and seconds. use a degree symbol for degrees, single quote for minutes, double quote for seconds.

---

**Problem Domain:**
- 1 degree = 60 minutes
- 1 minutes = 60 seconds

---

**Implicit Requirements:**
- Use degree symbol for degrees
- Use single quote for minutes
- Use double quote for seconds
- Use two digit numbers with leading zeros when formatting the minutes and seconds.
- Use provided constant below to represent the degree symbol.

DEGREE = "\xC2\xB0"

---

**Clarifying Questions:**

1. Is there a preference between whether 360 degrees returns 360 or 0? (last example)
    - No, no preference.

---

**Mental Model:**
- Determine degrees in input float.
- Determine minutes in input float.
- Determine second in input float.
- Format degrees, minutes, seconds into a string per requirements.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

---

Data Structure
--------------
- Use floats to perform degree, minutes, seconds calculations.
- Use string concatenation to build out final string.

---

Algorithm
---------

- Determine degrees in input float.
  - Input rounded down to the nearest integer. Save as degrees
- Determine minutes in input float.
  - Subtract degrees from input float. Multiply by 60. Save to min_and_sec.
  - Round down to nearest integer. Save as minutes.
- Determine second in input float.
  - Subtract minutes from min_and_sec. Save as seconds.
- Format degrees, minutes, seconds into a string per requirements.
  - Use string concatenation to format answer.
  - Return formatted string.

Code
----

=end

DEGREE = "\xC2\xB0"
MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTE = 60

def dms(input_float)
  input_float %= 360
  degrees = input_float.floor
  min_and_sec = (input_float - degrees) * MINUTES_IN_DEGREE
  minutes = min_and_sec.floor
  seconds = ((min_and_sec - minutes) * SECONDS_IN_MINUTE).round
  if seconds == 60
    seconds = 0
    minutes += 1
  end
  
  "#{degrees}#{DEGREE}#{format("%02d",minutes)}'#{format("%02d", seconds)}\""
end

#LS Solution

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

#Further Exploration

def dms(degrees_float)
  degrees_float %= degrees_float # Added line
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end