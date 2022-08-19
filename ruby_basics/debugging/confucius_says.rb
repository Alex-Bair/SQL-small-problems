=begin
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'
=end
=begin

The problem in the code above is that the get_quote method has multiple independent if statements. This means that when the last if statement's condition isn't true, it's evaluated as nil, and the method's return value is nil since the if statement is the last evaluated line of the method.
We can fix this by refactoring the independent if statements into an if-elsif-else statement.

=end

def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  else
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'