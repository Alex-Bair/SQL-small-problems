require 'minitest/autorun'

class TestCase < Minitest::Test
  def test_
    list = ['xyz']
    refute_includes(list, 'xyz')
  end
end