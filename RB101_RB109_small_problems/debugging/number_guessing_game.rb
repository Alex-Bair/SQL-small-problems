def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0
  
  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
end

guess_number(10, 3)

=begin
Bugs:
- winning number is changing
- program does not stop after maximum number of guesses
- program does not stop after correctly guessing the number

The #guess_number method is not correctly written to be a recursive method and should NOT call itself on line 28. The logic to try again is already implemented by the Kernel#loop method call on line 9, the `attempts` counter incrementer on line 10, and the break condition on line 11.
Correctly guessing the number also does not exit the loop from lines 9 - 27. The break keyword should be added after line 22 to exit the loop once the correct number is guessed.

=end