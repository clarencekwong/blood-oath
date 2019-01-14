class Cult

  attr_accessor :name, :location, :founding_year, :slogan, :min_age

  @@all = []

  def initialize(name,location,founding_year=nil, min_age=nil, slogan=nil)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @min_age = min_age
    @@all << self
  end

  def self.all
    @@all
  end

  def followers
    bloodoaths.map do |bloodoath|
      bloodoath.follower
    end
  end

  def bloodoaths
    Bloodoath.all.select do |bloodoath|
      bloodoath.cult == self
    end
  end

  def recruit_follower(follower)
    if old_enough?(follower)
      Bloodoath.new(follower, self)
    else
      "Not old enough."
    end
  end

  def old_enough?(follower)
    if follower.age > min_age
      true
    else
      false
    end
  end

  def cult_population
    self.followers.size
  end

  def self.find_by_name(name)
    self.all.find do |cult|
      cult.name == name
    end
  end

  def self.find_by_location(location)
    self.all.find_all do |cult|
      cult.location == location
    end
  end

  def self.find_by_founding_year(year)
    self.all.find_all do |cult|
      cult.founding_year == year
    end
  end
end
