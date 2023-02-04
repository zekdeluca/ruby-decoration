class CarefulThing
  DECORATED_METHODS = [:move, :stop, :jump]

  def initialize(thing)
    @thing = thing
  end

  def check_before_acting(action, *args)
    "#{@thing.name} looks around, everything looks fine. #{@thing.send(action, *args)}"
  end

  def method_missing(method, *args)
    if DECORATED_METHODS.include?(method)
      check_before_acting(method, *args)
    else
      @thing.send(method, *args)
    end
  end
end
