class Biker
  attr_reader :name, 
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
  @name = name
  @max_distance = max_distance
  @rides = {}
  @acceptable_terrain = []
  end

  def learn_terrain(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if @rides[ride]
      @rides[ride] << time
    else
      @rides[ride] = [time]
    end
  end

  def personal_record(ride)
    fastest_ride = []
    rides.each do |ride|
      fastest_ride << ride.last.min
    end
    fastest_ride.flatten
  end
end