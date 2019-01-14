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

  def average_age
    total_age = followers.reduce(0) do |sum, follower|
      sum + follower.age
    end
    total_age / followers.size.to_f
  end

  def my_followers_mottos
    followers.map do |follower|
      follower.life_motto
    end
  end

  def self.least_popular
    #returns first instances with the smallest population
    fewest_members = 0
    smallest_cult = nil
    self.all.each do |cult|
      if fewest_members == 0 && smallest_cult == nil
        fewest_members = cult.cult_population
        smallest_cult = cult
      elsif fewest_members == 0 && smallest_cult != nil
        next
      elsif cult.cult_population < fewest_members
        fewest_members = cult.cult_population
        smallest_cult = cult
      end
    end
    smallest_cult
  end

  def self.most_common_location
    #returns last instances with the most common location
    most_common = 0
    common_location = nil
    locations.each do |location|
      if most_common < Cult.find_by_location(location).size
        most_common = Cult.find_by_location(location).size
        common_location = location
      end
    end
    common_location
  end

  def self.locations
    self.all.map do |cult|
      cult.location
    end.uniq
  end
end
