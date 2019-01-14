class Bloodoath

  attr_reader :initiation_date, :follower, :cult

  @@all = []

  def initialize(follower, cult)
    @initiation_date = Time.now
    @initiation_date = @initiation_date.strftime("%F")
    @follower = follower
    @cult = cult

    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    @@all[0].follower
  end

end
