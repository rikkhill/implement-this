require "test/unit"
require_relative "../lib/sorting"

include Sort

class TestSimple < Test::Unit::TestCase
  def test_mergesort
    assert_equal([1,2,3,4,5,6], mergesort([6,2,4,3,5,1]),
      "mergesort sorts")

    assert_equal([1,1,1,2,2,2], mergesort([2,2,2,1,1,1]),
      "mergesort handles equal values without freaking out")

    assert_equal([1,2], mergesort([2,1]),
      "mergesort handles two-element arrays without freaking out")

    assert_equal([1], mergesort([1]),
      "mergesort handles singletons without freaking out")

    ints = (0..100).to_a
    assert_equal(ints, mergesort(ints.shuffle),
      "mergesort on 100-element shuffled array")
  end

  def test_quicksort
    assert_equal([1,2,3,4,5,6], quicksort([6,2,4,3,5,1]),
      "quicksort sorts")

    assert_equal([1,1,1,2,2,2], quicksort([2,2,2,1,1,1]),
      "quicksort handles equal values without freaking out")

    assert_equal([1,2], quicksort([2,1]),
      "quicksort handles two-element arrays without freaking out")

    assert_equal([1], quicksort([1]),
      "quicksort handles singletons without freaking out")

    ints = (0..100).to_a
    assert_equal(ints, quicksort(ints.shuffle),
      "quicksort on 100-element shuffled array")
  end

end
