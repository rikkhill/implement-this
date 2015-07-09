require "test/unit"
require_relative "../lib/sorting"

include Sort

class TestMergesort < Test::Unit::TestCase
  def test_mergesort
    assert_equal([1,2,3,4,5,6], mergesort([6,2,4,3,5,1]), "mergesort sorts")
  end

end
