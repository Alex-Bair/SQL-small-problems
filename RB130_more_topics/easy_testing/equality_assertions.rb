require 'minitest/autorun'

class TestCases < Minitest::Test
  def test_downcase
    value = 'XYz'
    assert_equal('xyz', value.downcase)
  end
end