# THE RULES OF DUTCH NUMBERS
#
# - Implement a number system (natural numbers, integers, rationals, reals, etc)
#   in your programming language of choice
#
# - Your number system cannot be internally represented by any of the
#   numeric datatypes in your implementation language
#
# - Points for how fully-featured your number system is
#
# - Points for how mathematically opulent your number system is
#
# - Points for how ridiculous your number system is
#
# - No points for speed or numerical efficiency


# Counter
# An object with magnitude used to represent natural numbers
class Counter
  include Comparable

  def initialize(value = nil)
    @magnitude = nil

    if value.is_a?(Array) && value.flatten.shift.nil?
      @magnitude = value
    end

    # We are totally allowed to use numerics when interpolating numerics
    if value.is_a? Integer
      (1..(value.abs)).each do
        @magnitude = increment(@magnitude)
      end
    end
  end

  # Deep copy of the object's magnitude
  def mag
    Marshal::load(Marshal.dump(@magnitude))
  end

  def increment(inner = nil)
    [inner]
  end

  def decrement(outer)
    outer.shift
  end

  def inc
    @magnitude = increment(@magnitude)
    self
  end

  def dec
    @magnitude = decrement(@magnitude)
    self
  end

  def zero
    Counter.new(nil)
  end

  def one
    Counter.new([nil])
  end

  def zero?
    @magnitude.nil?
  end

  def over
    mag = self.mag

    loop do
      break if mag.nil?
      mag = decrement(mag)
      yield(mag)
    end
  end

  def inspect
    to_s
  end

  def to_s

    n = []
    over { n.push([]) }
    n.length.to_s

  end

  def +(other)
    b_mag = other.mag
    over {
      b_mag = increment(b_mag)
    }

    Counter.new(b_mag)

  end

  def *(other)

    cardinality = nil
    over do
      other.over do
        cardinality = increment(cardinality)
      end
    end

    Counter.new(cardinality)

  end

  def <=>(other)

    max = self + other

    return 0 if mag == other.mag

    max.over do |i|
      return 1 if i == mag
      return -1 if i == other.mag

      # Should never get here
      raise RangeError if i == max.mag
    end

  end
end


# Dutch Integers
class Dint
  include Comparable

  attr_accessor :positive, :negative
  def initialize(value = nil, positive = true)
    @positive = nil
    @negative = nil

    magnitude = Counter.new(value)
    # If the value is negative or the sign boolean suggests so...
    if (value.is_a?(Integer) && value.negative?) || !positive
      @negative = magnitude
      @positive = Counter.new
    else
      @positive = magnitude
      @negative = Counter.new
    end

    if value.is_a? Dint
      @positive = Counter.new(value.positive.mag)
      @negative = Counter.new(value.negative.mag)
    end
  end


  # Our integer has a positive component
  def reduce_to_canonical
    while !@positive.zero? && !@negative.zero?
      @positive.dec
      @negative.dec
    end

  end

  def inspect
    to_s
  end

  def to_s
    neg? ? ('-' << @negative.to_s) : @positive.to_s
  end

  def pos?
    @negative.zero?
  end

  def neg?
    !@negative.zero?
  end

  def <=>(other)
    diff = self - other
    return 0 if diff.positive == diff.negative
    return -1 if diff.positive > diff.negative
    return 1 if diff.positive < diff.negative

    # nil if this somehow fails
    nil
  end

  def -@
    @positive, @negative = @negative, @positive
  end

  def +(other)
    ret = Dint.new
    ret.positive = @positive + other.positive
    ret.negative = @negative + other.negative
    ret.reduce_to_canonical
    ret
  end

  def -(other)
    ret = Dint.new
    ret.positive = @positive + other.negative
    ret.negative = @negative + other.positive
    ret.reduce_to_canonical
    ret
  end

  def *(other)
    ret = Dint.new
    ret.positive = (@positive * other.positive) + (@negative * other.negative)
    ret.negative = (@negative * other.positive) + (@positive * other.negative)
    ret.reduce_to_canonical
    ret
  end

end



