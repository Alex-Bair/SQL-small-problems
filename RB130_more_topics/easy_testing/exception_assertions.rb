require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise(NoExperienceError, 'Insufficient experience')
  end
end


class TestCase < Minitest::Test
  def test_
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end