require 'test/unit'
require_relative "../lib/exercises/swiss_army_plus"

class TestSimple < Test::Unit::TestCase
  def test_plus
    assert_equal((SwissInteger.new 10) + 5, 15, "10 + 5 = 15")
    assert_equal((SwissInteger.new 1) + 1, 2, "1 + 1 = 2")
    assert_equal((SwissInteger.new 2) + 2, 4, "2 + 2 = 4")
    assert_equal((SwissInteger.new 100) + 100, 200, "100 + 100 = 200")
  end

  def test_multiply
    assert_equal((SwissInteger.new 10) * 5, 50, "10 * 5 = 50")
    assert_equal((SwissInteger.new 1) * 1, 1, "1 * 1 = 1")
    assert_equal((SwissInteger.new 2) * 2, 4, "2 * 2 = 4")
    assert_equal((SwissInteger.new 100) * 100, 10000, "100 * 100 = 10000")
  end

end
