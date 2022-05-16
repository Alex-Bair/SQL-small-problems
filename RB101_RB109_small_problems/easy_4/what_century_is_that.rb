SUFFIX = {
  1 => "st",
  2 => "nd",
  3 => "rd",
}

SUFFIX.default = "th"

def get_suffix(century)
  century_digits = century.digits
  if century_digits[1] == 1
    'th'
  else
    SUFFIX[century_digits[0]]
  end
end

def century(year)
  century = (year / 100.0).ceil
  "#{century}#{get_suffix(century)}"
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'