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

f1 = Follower.new("Dave", 9, "I like turtles")
f2 = Follower.new("Jane", 18, "I like boys")
f3 = Follower.new("Janet", 10, "I like girls")
f4 = Follower.new("Geoff", 12, "I like ninja turtles")

# puts c1.recruit_follower(f1)
# puts " cult.recruit_follower is working true?: #{c1.followers[0] == f1}"
# c2.recruit_follower(f2)
# c3.recruit_follower(f1)
#
# puts f3.join_cult(c3)
# f3.join_cult(c4)

# puts f1.fellow_cult_members

# binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
