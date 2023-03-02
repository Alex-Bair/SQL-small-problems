require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text_class'

class TextTests < Minitest::Test
  def setup
    @file = File.open('sample_text.txt')
    @text = Text.new(@file.read)
    @swapped_file = File.open('sample_text_swapped.txt')
  end
  
  def test_swap
    assert_equal(@swapped_file.read, @text.swap('a', 'e'))
  end
  
  def test_word_count
    num_of_words = @text.word_count
    expected_num_of_words = 72
    assert_equal(expected_num_of_words, num_of_words)
  end
  
  def teardown
    @file.close
    @swapped_file.close
    puts "File has been closed: #{@file.closed?}"
  end
end