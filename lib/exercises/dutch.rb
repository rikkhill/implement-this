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

class Dutch
  include Comparable

  attr_accessor :sign

  def initialize(value=(), sign=true)
    @representation = self.coerce_representation(value)
    @sign = sign
  end

  # Get a deep copy of the representation
  def rep
    Marshal::load(Marshal.dump(@representation))
  end

  def clone
    Dutch.new(@representation, @sign)
  end

  def increment(inner = [()])
    [inner]
  end

  def decrement(outer)
    outer.shift
  end

  def -@
    Dutch.new(self, !@sign)
  end

  def zero
    Dutch.new(())
  end

  def one
    Dutch.new([()])
  end

  def coerce_representation a

    rep = ()

    if a.is_a? Dutch
      rep = a.rep
    end

    if a.is_a? Array and a.flatten.shift.nil?
      rep = a
    end

    # We're allowed to use integers when turning
    # integers into something else, otherwise
    # madness would reign
    if a.is_a? Integer
      for i in 1..a
        rep = increment(rep)
      end
    end

    rep

  end

  # It turns out you can't define a ++ method in Ruby
  def inc
    @representation = increment(@representation)
    self.to_s
  end

  def dec
    @representation = decrement(@representation)
    self.to_s
  end

  def to_s

    # Cheating while I figure this out

    n = []

    self.over { n.push([]) }

    (@sign ? "" : "-") << n.length.to_s

  end

  def over
    rep = self.rep

    loop do
      break if rep.nil?
      rep = decrement(rep)
      yield
    end
  end


  def inspect
    self.to_s
  end

  def +(b)
    b_rep = b.rep
    self.over {
      b_rep = increment(b_rep)
    }

    Dutch.new(b_rep)

  end

  def *(b)

    sign = self.sign == b.sign
    cardinality = ()
    self.over {
      b.over {
        cardinality = increment(cardinality)
      }
    }

    Dutch.new(cardinality, sign)

  end

  def -(b)

    magnitude = zero
    sign = true

    if self > b
      counter = Dutch.new(self)
      while counter > b do
        magnitude.inc
        counter.dec
      end
    elsif self < b
      sign = false
      counter = Dutch.new(b)
      while counter > self
        magnitude.inc
        counter.dec
      end
    end

    return Dutch.new(magnitude.rep, sign)

  end

  def /(b)
    raise NotImplementedError
  end

  def <=>(b)
    # We're also allowed to use numerical values here
    # because the Comparable module requires it
    max = self + b
    counter = zero

    a_rep = self.rep
    b_rep = b.rep

    # We can directly check equality of the representation
    # God Bless Ruby
    if a_rep == b_rep
      return 0
    end

    # We can short-circuit this entire process if
    # the numbers have different signs
    if self.sign != b.sign
      if self.sign = false
        return -1
      else
        return 1
      end
    end

    loop do
      if counter.rep == a_rep
        if self.sign == true
          return -1
        else
          return 1
        end
      end

      if counter.rep == b_rep
        if self.sign == true
          return 1
        else
          return -1
        end
      end

      # Should never get here
      if counter.rep == max.rep
        raise RangeError
      end

      counter.inc

    end




  end


end



