require 'test/unit'
require_relative '../lib/exercises/dutch'

# Tests for Counter class
class TestCounter < Test::Unit::TestCase

  def setup
    @zero = Counter.new(0)
    @one = Counter.new(1)
    @two = Counter.new(2)
    @five = Counter.new(5)
    @ten = Counter.new(10)
  end

  def test_smoke
    # Can we create Counters and call all their methods without dying?
    counter_a = nil
    counter_b = nil

    assert_nothing_raised 'Instantiate counters' do
      counter_a = Counter.new(4)
      counter_b = Counter.new(nil)
    end

    assert_nothing_raised 'Incrementing and decrementing counters' do
      counter_b.inc
      counter_b.dec
      counter_b.inc.inc.inc.inc
      counter_b.dec.dec
    end

    assert_nothing_raised 'Operators for counters' do
      counter_a + counter_b
      counter_a * counter_b
      counter_a < counter_b
      counter_a > counter_b
      counter_a == counter_b
    end
  end

  def test_addition
    assert_equal(@zero + @one, @one, '0 + 1 = 1')
    assert_equal(@one + @one, @two, '1 + 1 = 2')
  end

  def test_inc_and_dec
    assert_equal(Counter.new(1).inc, @two, '1++ = 1')
    assert_equal(Counter.new(2).dec, @one, '2-- = 1')
  end
end
