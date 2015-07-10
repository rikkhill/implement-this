# Sorting algorithms
require 'pp'
module Sort

  def mergesort(a)
    if a.length <= 1
      return a
    end

    left = mergesort(a[0..a.length/2-1])
    right = mergesort(a[a.length/2..-1])
    accumulator = []

    until left.length == 0 || right.length == 0 do
      accumulator.push(left[0] < right[0] ? left.shift : right.shift)
    end
    accumulator += (left + right)

    return accumulator
  end

  def quicksort(a)
    if a.length <=1
      return a
    end

    pivot_index = a.length/2
    pivot = a[pivot_index]
    left = []
    right = []

    (a[0..pivot_index - 1] + a[pivot_index + 1..-1]).each do |element|
      if element < pivot then
        left.push(element)
      else
        right.push(element)
      end
    end

    return quicksort(left) + [pivot] + quicksort(right)
  end

end

include Sort
