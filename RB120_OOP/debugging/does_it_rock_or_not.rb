=begin

After chaning the API_KEY to the incorrect string, the final three lines of code do not throw the error message "API key is not valid".

Instead, the following is always output instead:

Sushi rocks!
Rain rocks!
Bug hunting rocks!

This occurs because the first line of the Score#for_term class method raises the custom AuthenticationError exception, then we rescue every Exception by returing the NoScore class.

This means that local variable score in the Score::find_out class method is initialized to DoesItRock::NoScore. The case statement in DoesItRock::find_out uses Module#=== for the comparison. Module#=== checks if the argument is an instance of the calling class.
Since NoScore is NOT an object of the NoScore class (it's just a reference to the class itself), the first branch is not executed. The next two branches also not executed, which then forces the else branch to execute. The else branch of the case statement contains the string interpolation for "#{term} rocks!", which is why we constantly see it when the exception is raised.

To fix this, we can:
1. Not rescue every Exception exception within the DoesItRock::for_term method. The primary Exception handling is performed in the Score::find_out method. In DoesItRock::for_term, we should only rescue ZeroDivisionError exceptions.
2. When rescuing ZeroDivisionError exceptions, return an instance of the NoScore class.
2. a - while the LS solution mentions chaning the exception handling in Score::for_term to only handle ZeroDivisionError exceptions, I do not think this is necessary. The expression positive / (positive + negative) always uses floats. The only case where 0.0 would be the denominator is when it is also the numerator. In Ruby 0.0 / 0.0 evaluates to NaN, which does NOT raise an exception. To resolve this, we should write a Score::valid? method to check for NaN and raise a ZeroDivisionError if the calculation is NaN..
3. Change the rescue Exception within DoesItRock::for_term to only rescue StandardError exceptions.
4. Have AuthenticationError inherit from StandardError instead of from Exception.

=end

require 'pry'

class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
    0.0
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      score = positive / (positive + negative)

      raise ZeroDivisionError unless valid?(score)

      score

    rescue ZeroDivisionError
      NoScore.new
    end

    def self.valid?(score)
      !score.nan?
    end
    
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!


#LS Solution

=begin

1. Make AuthenticationError inherit from StandardError.
2. Rescue only ZeroDivisionError within Score::for_term.
3. Within the ZeroDivisionError rescue, instantiated a new NoScore object (i.e. add .new to the end of the current class reference)
4. Only rescue StandardErrors within the DoesItRock::find_out method.

=end