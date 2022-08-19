numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select {|_, v| v < 25}

p low_numbers