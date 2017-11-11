require 'test/unit'
require_relative '../lib/exercises/dutch'

# Tests for Dutch Numbers

# We can check this object satisfies the axioms for
# a ring over the integers

class TestIntegerRing < Test::Unit::TestCase

  def setup
    @zero = Dutch.new(0)
    @one = Dutch.new(1)
    @two = Dutch.new(2)
    @five = Dutch.new(5)
    @ten = Dutch.new(10)
    @sixtysix = Dutch.new(66)
    @twohundred = Dutch.new(200)

    @neg_one = Dutch.new(-1)
    @neg_two = Dutch.new(2)
    @neg_five = Dutch.new(5)
    @neg_ten = Dutch.new(10)
  end

  # ADDITION

  def test_addition_identity
    assert_equal(@zero + @zero, @zero, 'Zero is identity under addition for 0')
    assert_equal(@one + @zero, @one, 'Zero is identity under addition for 1')
    assert_equal(@ten + @zero, @ten, 'Zero is identity under addition for 10')
    assert_equal(@twohundred + @zero, @twohundred, 'Zero is additive identity under addition for 200')
  end

  def test_positive_addition
    assert_equal(@one + @one, @two, "One plus one is two")
    assert_equal(@two + @two, Dutch.new(4), "Two plus two is four")
    assert_equal(@ten + @ten, Dutch.new(20), "Ten plus ten is twenty")
  end

  def test_negative_addition
    assert_equal(@neg_one + @neg_one, @neg_two, "-1 + -1 = -2")
    assert_equal(@neg_two + @neg_two, Dutch.new(-4), "-2 + -2 = -4")
    assert_equal(@neg_five + @neg_five, @neg_10, "-5 + -5 = -10")
  end

  def test_mixed_sign_addition
    assert_equal(@neg_one + @two, @one, "-1 + 2 = 1")
    assert_equal(@neg_two + @one, @neg_one, "-2 + 1 = -1")
    assert_equal(@neg_five + @five, @zero, "-5 + 5 = 0")
  end

  def test_addition_associativity
    # This should hold for all n in Z, but lets just test this one...
    assert_equal((@one + @two) + @five, @one + (@two + @five))
  end

  # MULTIPLICATION

  def test_multiplicative_identity
    assert_equal(@one * @zero, @zero, 'One is identity under multiplication for 0')
    assert_equal(@one * @one, @one, 'One is identity under multiplication for 1')
    assert_equal(@ten * @one, @ten, 'One is identity under multiplication for 10')
    assert_equal(@twohundred * @one, @twohundred, 'One is identity under multiplication for 200')
  end

end

