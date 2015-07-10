require "test/unit"
require_relative "../lib/datastructures"
require 'pp'

include DataStructures

class TestSimple < Test::Unit::TestCase
  def test_hash
    assert_nothing_thrown("Empty hash builds fine") { superhash }

    init_hash = superhash([
      ["fish", "pie"],
      ["crab", "meat"],
      ["prawn", "cocktail"]
    ])

    ## This inexplicably fails occasionally
    assert_equal(["pie", "meat", "cocktail"],
      [init_hash.fetch("fish"), init_hash.fetch("crab"), init_hash.fetch("prawn")],
      "Initialised hash builds and fetches fine"
    )

    assert_equal(["pie", "meat", "cocktail"].sort, init_hash.vals.sort,
      "Initialised hash reports correct vals")

    assert_equal(["fish", "crab", "prawn"].sort, init_hash.keys.sort,
      "Initialised hash reports correct keys")

    init_hash.insert("prawn", "jambalaya")
    assert_equal("jambalaya", init_hash.fetch("prawn"),
      "Initialised hash overwrites fine")

    assert_equal("meat", init_hash.fetch(:crab),
      "Initialised hash accepts tokens as keys")

    init_hash.delete("fish")
    assert_equal(nil, init_hash.fetch("fish"), "Initialised hash deletes fine")

    big_hash = superhash((1..32).to_a.zip((1..32).to_a))
    assert_nothing_thrown("Hash upscales gracefully") {
      big_hash.insert("Extra", "Extra")
    }


    assert(big_hash.length > 32, "Hash size greater than upscale threshold")
    big_hash.keys.each do |k|
      assert_equal(k, big_hash.fetch(k).to_s, "Upscaled keys and values align")
    end

  end
end
