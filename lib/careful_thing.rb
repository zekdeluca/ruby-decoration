class CarefulThing
  DELEGATED_METHODS = [:move, :stop, :jump]

  def initialize(thing)
    @thing = thing
  end

  def check_before_acting(action, *args)
    "#{@thing.name} looks around, everything looks fine. #{@thing.send(action, *args)}"
  end

  def method_missing(method, *args)
    if DELEGATED_METHODS.include?(method)
      check_before_acting(method, *args)
    else
      super
    end
  end
end
