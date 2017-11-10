# From Cracking the Coding Interview:
# "Write methods for implementing the multiply,
# subtract and divide operators for integers.
# Use only the add operator."

# I like the cut of this problem's jib

# This seems to ban most common binary operators, but doesn't
# say anything about the unary `-` operator. This problem seems
# extraordinarily easy if given unary `-` but extraordinarily hard
# if not given it. As such, I'm going to judiciously choose when
# unary `-` is warranted


# The SwissInteger class is a first-pass, quick-and-dirty attempt

class SwissInteger

  def initialize x
    @x = x
  end

  # An obvious way of implementing the plus operator is simple transparent usage
  def +(y)
    @x + y
  end


  # One way of implementing multiplication for positive integers is to just iterate
  # over the range. We could also do this by taking the cardinality of the cartesian
  # product
  def *(y)
    z = 0

    for i in 1..y do
      z += @x
    end
    z
  end


  def -(y)

    # We have three cases: x > y,  y > x, and x == y

    overage = 0
    # In the first case we'll get a positive integer
    if @x > y
      for i in 1..@x
        if i > y
          overage += 1
        end
      end

      overage

    # In the second case, we'll get a negative number
    elsif y > @x
      for i in 1..y
        if i > @x
          overage += 1
        end
      end

      # I am fairly sure it is impossible to produce a negative
      # integer from positive integers using only the `+` operator
      # (since the positive integers are closed under addition),
      # therefore I feel fine in using unary `-` in this case
      -(overage)

    # In the final case, the difference must be zero
    else
      0
    end
  end

  # Division
  def /(y)

    divisor = 0
    counter = 0

    for i in 1..@x
      divisor += 1

      if divisor == y
        divisor = 0
        counter += 1
      end

    end

    counter

  end

end



