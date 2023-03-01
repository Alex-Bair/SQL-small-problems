def none?(array)
  array.each { |element| return false if yield(element) == true}
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true

# LS Solutions

def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end

def none?(collection, &block)
  !any?(collection, &block)
end
