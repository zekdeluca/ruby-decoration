require_relative './test_helper'
require_relative '../lib/thing'
require_relative '../lib/careful_thing'

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

class CarefulThingTest < Minitest::Test
  attr_accessor :thing
  attr_accessor :careful_thing

  def setup
    @thing = Thing.new("Thing")
    @careful_thing = CarefulThing.new(thing)
  end

  def test_careful_thing_moves_carefully
    expected = "Thing looks around, everything looks fine. Thing is moving..."
    assert_equal expected, careful_thing.move
  end

  def test_careful_thing_stops_carefully
    expected = "Thing looks around, everything looks fine. Thing has stopped."
    assert_equal expected, careful_thing.stop
  end
end