#My solution:
def leap_year?(year)
  ( year % 4 == 0 && year % 100 != 0 ) ||
  ( year % 400 == 0 )
end

#Further exploration
#Sequence of checks in leap_year? method below will fail for all years that are divisible by 400. The divisible by 100 check will always return false before we check if the year is divisble by 400.

def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

#Method below will test whether the year is divisible by 4 first, then divisible by 100 second, and divisible by 400 last. This solution is a bit more complex than the original longer solution due to the use of both != and not just ==. I prefer the shorter solution I came up with, I think it's easier to understand & think through the logic.

def leap_year?(year)
  if year % 4 != 0 
    false
  elsif year % 100 != 0
    true
  else
    year % 400 == 0
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true