class CarefulThing
  def initialize(thing)
    @thing = thing
  end

  def check_before_acting(action)
    "#{@thing.name} looks around, everything looks fine. #{@thing.send(action)}"
  end

  def move
    check_before_acting(:move)
  end

  def stop
    check_before_acting(:stop)
  end

  def jump
    check_before_acting(:jump)
  end
end
