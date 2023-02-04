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

  def jump
    "#{name} has jumped!"
  end

  def act_carelessly
    "#{name} is acting carelessly!"
  end
end
