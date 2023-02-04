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

  def test_thing_jumps
    expected = "Thing has jumped!"
    assert_equal expected, thing.jump
  end

  def test_thing_acts_carelessly
    expected = "Thing is acting carelessly!"
    assert_equal expected, thing.act_carelessly
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

  def test_careful_thing_jumps_carefully
    expected = "Thing looks around, everything looks fine. Thing has jumped!"
    assert_equal expected, careful_thing.jump
  end

  def test_non_safelisted_methods_are_executed_without_decoration
    refute_match "Thing looks around, everything looks fine. ", careful_thing.act_carelessly
  end

  def test_unknown_methods_are_not_handled
    assert_raises(NoMethodError) do
      careful_thing.is_careless
    end
  end

  def test_object_methods_are_executed_normally
    assert_respond_to careful_thing, :to_s
    refute_match "Thing looks around, everything looks fine. ", careful_thing.to_s
  end
end
