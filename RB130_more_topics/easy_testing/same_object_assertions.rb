require 'minitest/autorun'

class List
  def process
    self
  end
end

class TestCase < Minitest::Test
  def test_
    list = List.new
    assert_same(list, list.process)
  end
end