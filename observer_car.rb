require "observer"

class Car
  include Observable
  attr_reader :color, :name

  def initialize(color, name)
    @color = color
    @name = name
  end

  def paint(color)
    @color = color
    changed
    notify_observers(self)
    true
  end
end

class CarObserver
  def initialize(car)
    @car = car
    @car.add_observer(self)
  end

  def update(car)
    puts "Cor do #{car.name} alterada, para #{car.color}, solicitando a alteração no documento."
  end
end
