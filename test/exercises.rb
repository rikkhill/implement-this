require 'test/unit'
require_relative '../lib/exercises/swiss_army_plus'

# These are not massively principled.
# They should probably test group axioms or something

class TestArithmetic < Test::Unit::TestCase
  def test_plus
    assert_equal((SwissInteger.new 10) + 5, 15, '10 + 5 = 15')
    assert_equal((SwissInteger.new 1) + 1, 2, '1 + 1 = 2')
    assert_equal((SwissInteger.new 2) + 2, 4, '2 + 2 = 4')
    assert_equal((SwissInteger.new 100) + 100, 200, '100 + 100 = 200')
  end

  def test_multiply
    assert_equal((SwissInteger.new 10) * 5, 50, '10 * 5 = 50')
    assert_equal((SwissInteger.new 1) * 1, 1, '1 * 1 = 1')
    assert_equal((SwissInteger.new 2) * 2, 4, '2 * 2 = 4')
    assert_equal((SwissInteger.new 100) * 100, 10000, '100 * 100 = 10000')
  end

  def test_minus
    assert_equal((SwissInteger.new 10) - 5, 5, '10 - 5 = 5')
    assert_equal((SwissInteger.new 1) - 1, 0, '1 - 1 = 0')
    assert_equal((SwissInteger.new 2) - 4, -2, '2 - 4 = -2')
    assert_equal((SwissInteger.new 100) - 10, 90, '100 - 10 = 90')
  end

  def test_divide
    assert_equal((SwissInteger.new 10) / 2, 5, '10 / 2 = 5')
    assert_equal((SwissInteger.new 13) / 5, 2, '13 / 5 = 2')
    assert_equal((SwissInteger.new 2) / 2, 1, '2 / 2 = 1')
    assert_equal((SwissInteger.new 100) / 10, 10, '100 / 10 = 10')
  end
end
