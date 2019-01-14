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

  def my_cults_slogans
    cults.each do |cult|
      puts cult.slogan
    end
  end

  def self.most_active
    # most_active = 0
    # overachiever = nil
    # self.all.each do |follower|
    #   if most_active < follower.cults.size
    #     most_active = follower.cults.size
    #     overachiever = follower
    #   end
    # end
    # most_active

    top_ten[0]
  end

  # def top_ten
  #   top_ten = []
  #   10.times do
  #     if top_ten.length = 0
  #       top_ten << self.most_active
  #     else
  #       exclude_ranked(top_ten)
  #     end
  #   end
  # end
  #
  # def exclude_ranked(array)
  #
  # end

  def self.top_ten
    # store hash of followers with their membership counts
    follower_hash = Follower.follower_hash_builder
    # sort_by hash by value and turn it back into a hash
    # binding.pry
    sorted_hash = follower_hash.sort_by do |key,value|
      value
    end
    return sorted_hash.reverse!.first(10).to_h.keys
    binding.pry
  end

  def self.follower_hash_builder
    follower_hash = {}
    self.all.each do |follower|
      follower_hash[follower] = follower.cults.size
    end
    follower_hash
  end

# an array of hashes with follower object id as key, and number of cult memberships as value
#sort_by membership number

end
