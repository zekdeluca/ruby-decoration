require_relative './test_helper'
require_relative '../lib/thing'

class ThingTest < Minitest::Test
  attr_accessor :thing

  def setup
    @thing = Thing.new("Thing")
  end

  def test_thing_moves
    expected = "Thing is moving..."
    assert_equal expected, thing.move
  end

  def test_thing_stops
    expected = "Thing has stopped."
    assert_equal expected, thing.stop
  end
end
