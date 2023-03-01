class GuessingGame
  
  def initialize(low_limit, high_limit)
    @guesses_remaining = nil
    @range = (low_limit..high_limit)
    @number = nil
    @guess = nil
  end
  
  def play
    reset
    loop do
      state_guesses_remaining
      @guess = ask_for_number
      reduce_guesses_remaining
      feedback_on_guess
      break if game_over?
    end
    display_result
  end
  
  private

  def reset
    @number = rand(@range)
    @guesses_remaining = Math.log2(@range.size).to_i + 1
  end

  def display_result
    if correct_guess?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def game_over?
    @guesses_remaining == 0 || correct_guess?
  end

  def correct_guess?
    @guess == @number
  end

  def state_guesses_remaining
    if @guesses_remaining == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{@guesses_remaining} guesses remaining."
    end
  end
  
  def ask_for_number
    loop do
      puts "Enter a number between #{@range.first} and #{@range.last}:"
      answer = gets.chomp.to_i
      return answer if (@range).cover?(answer)
      puts "Invalid guess."
    end
  end
  
  def reduce_guesses_remaining
    @guesses_remaining -= 1
  end
  
  def feedback_on_guess
    case @guess <=> @number
    when 0 then puts "That's the number!"
    when -1 then puts "Your guess is too low."
    when 1 then puts "Your guess is too high."
    end
    puts
  end
end


game = GuessingGame.new(501, 1500)
game.play

game.play