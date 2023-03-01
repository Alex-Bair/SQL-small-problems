class MinilangError < StandardError
end

class InvalidTokenError < MinilangError
end

class EmptyStackError < MinilangError
end

class Minilang
  def initialize(text)
    @register = 0
    @stack = []
    @commands = text.split(' ')
    @invalid_command = nil
  end
  
  def eval
    @commands.each { |token| eval_token(token) }
  rescue MinilangError => e
    puts e.message
  end
  
  private

  VALID_COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def eval_token(token)
    if number?(token)
      place_in_register(token.to_i)
    elsif valid_command?(token)
      send(token.downcase.to_sym)
    else
      raise InvalidTokenError, "Invalid token: #{token}"
    end
  end

  def valid_commands?
    @commands.all? do |command|
      @invalid_command = command unless valid_command_or_number?(command)
      valid_command_or_number?(command)
    end
  end

  def valid_command_or_number?(command)
    valid_command?(command) || number?(command)
  end

  def valid_command?(command)
    VALID_COMMANDS.include?(command)
  end

  def number?(str)
    !!(str =~ /\A[-+]?\d+\z/)
  end

  def place_in_register(num)
    @register = num
  end

  def push
    @stack << @register
  end

  def add
    empty_stack_check
    @register += popped_from_stack
  end
  
  def sub
    @register -= popped_from_stack
  end

  def mult
    @register *= popped_from_stack
  end
  
  def div
    @register /= popped_from_stack
  end
  
  def mod
    @register %= popped_from_stack
  end
  
  def pop
    @register = popped_from_stack
  end

  def print
    puts @register
  end

  def popped_from_stack
    empty_stack_check
    @stack.pop
  end

  def empty_stack_check
    raise EmptyStackError, "Empty stack!" if @stack.empty?
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)



# Further Exploration #1 - needs completed!


# Further Exploration #2 - needs completed!
# See my original solution - I had a separate method #popped_from_stack for just popping an element off the stack without reassignment of @register, and I used this in the individual methods instead of #pop to avoid ambiguity.