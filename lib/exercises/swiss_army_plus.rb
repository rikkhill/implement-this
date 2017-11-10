# From Cracking the Coding Interview:
# "Write methods for implementing the multiply,
# subtract and divide operators for integers.
# Use only the add operator."

class SwissInteger

  def initialize x
    @x = x
  end

  def +(y)
    @x + y
  end

  def *(y)
    z = 0

    for i in 1..y do
      z += @x
    end
    z
  end

end

