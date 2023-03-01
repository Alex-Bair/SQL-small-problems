require 'minitest/autorun'

class TestCase < Minitest::Test
  def test_
    list = []
    assert_includes(list, 'xyz') # Better failure message
    assert(list.include?('xyz'), "string 'xyz' not included in list array")
  end
end