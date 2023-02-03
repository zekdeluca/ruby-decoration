class Thing
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def move
    "#{name} is moving..."
  end

  def stop
    "#{name} has stopped."
  end
end
