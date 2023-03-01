require 'minitest/autorun'

class TestCase < Minitest::Test
  def test_
    value = 8
    assert_kind_of(Numeric, value)
  end
end