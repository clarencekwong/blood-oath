class Follower

  attr_accessor :name, :age, :life_motto
  attr_reader :cults

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def bloodoaths
    Bloodoath.all.find_all do |bloodoath|
      bloodoath.follower == self
    end
  end

  def cults
    self.bloodoaths.map do |bloodoath|
      bloodoath.cult
    end
  end

  def join_cult(cult)
    if old_enough?(cult)
      Bloodoath.new(self, cult)
    else
      "Not old enough."
    end
  end

  def old_enough?(cult)
    if self.age > cult.min_age
      true
    else
      false
    end
  end

  def self.of_a_certain_age(age)
    self.all.find_all do |follower|
      follower.age == age
    end
  end

  def fellow_cult_members
    memberArr = []
    self.cults.each do |cult|
      memberArr << cult.followers
    end
    remove_self(memberArr.flatten.uniq)
  end

  def remove_self(array)
    array.select do |member|
      member != self
    end
  end
end
