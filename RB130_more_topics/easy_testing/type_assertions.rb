require 'minitest/autorun'

class TestCase < Minitest::Test
  def test_
    value = 8
    assert_instance_of(Numeric, value) # better error message
    assert_equal(Numeric, value.class)
  end
end