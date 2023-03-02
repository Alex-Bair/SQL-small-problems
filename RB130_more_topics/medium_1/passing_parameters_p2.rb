def method(arr)
  yield(arr)
end

ARR = ['one', 'two', 'three', 'four', 'five', 'six']

method(ARR) {|_, _, *raptors| p raptors}

# LS Solution

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end