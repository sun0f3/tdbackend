module JSON
  def self.generate(object)
    # ...
    "{a: 1}"
  end

  def self.parse(json_string)
    {a: 1}
  end
end

class Car
  def speed
    @speed
  end
   
  def initialize(speed = 100)
    @speed = speed
  end

  def increase()
    @speed = @speed + 1
  end

  def decrease()
    @speed = @speed - 1
  end

  def stop()
    @speed = 0
  end
end

json = JSON.generate({a: 1})

car1 = Car.new()
car2 = Car.new()

car1.increase
car2.decrease
car1.stop

puts car1.speed
puts car2.speed

def car_new(speed)
  {"speed" =>  speed}
end
def car_increase(car)
  car["speed"] = car["speed"] + 1
  car
end

def car_stop(car)
  car["speed"] = 0
  car
end

def car_speed(car)
  car["speed"]
end


car3 = car_new(100)
car3 = car_increase(car3)

puts car_speed(car3)




