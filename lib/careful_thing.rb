class CarefulThing
  def initialize(thing)
    @thing = thing
  end

  def check_before_acting(action, *args)
    "#{@thing.name} looks around, everything looks fine. #{@thing.send(action, *args)}"
  end

  def method_missing(method, *args)
    check_before_acting(method, *args)
  end
end
