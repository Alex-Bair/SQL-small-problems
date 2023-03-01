require 'minitest/autorun'

class TestCase < Minitest::Test
  def test_
    list = [0]
    assert_empty(list) # Provides better failure message
    assert_equal(true, list.empty?)
  end
end