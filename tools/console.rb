require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("Heaven's Gate","South California",1974, 12)
c2 = Cult.new("People's Temple","JonesTown",1978, 12)
c3 = Cult.new("New People's Republic","South California",1989, 12)
c4 = Cult.new("Daves Town","Mexico City",1989, 12)

f1 = Follower.new("Dave", 13, "I like turtles")
f2 = Follower.new("Jane", 18, "I like boys")
f3 = Follower.new("Janet", 21, "I like girls")
f4 = Follower.new("Geoff", 25, "I like ninja turtles")
f5 = Follower.new("1", 13, "I like turtles 1")
f6 = Follower.new("2", 18, "I like boys 2")
f7 = Follower.new("3", 21, "I like girls 3")
f8 = Follower.new("4", 25, "I like ninja turtles 4")
f9 = Follower.new("5", 13, "I like turtles 5")
f10 = Follower.new("6", 18, "I like boys 6")
f11 = Follower.new("7", 21, "I like girls 7")
f12 = Follower.new("8", 25, "I like ninja turtles 8")

# puts c1.recruit_follower(f1)
# puts " cult.recruit_follower is working true?: #{c1.followers[0] == f1}"
# c2.recruit_follower(f2)
c3.recruit_follower(f1)
#
f3.join_cult(c3)
# f3.join_cult(c4)

# puts f1.fellow_cult_members

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
