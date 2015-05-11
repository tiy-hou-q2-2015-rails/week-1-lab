require 'pp'
require 'csv'



# parse with CSV into deliveries, and sum all the deliveries

class Delivery
  attr_accessor :destination, :money
end

deliveries = []

CSV.foreach("./planet_express_logs.csv", headers: true) do |row|
  data = row.to_hash
  delivery = Delivery.new
  delivery.destination = data["Destination"]
  delivery.money = data["Money we made"].to_f
  deliveries << delivery
end

pp deliveries

puts "How much money did we make this week?"
puts deliveries.map{|delivery| delivery.money}.reduce(:+)


### How much of a bonus did each employee get? (bonuses are paid to employees who pilot the Planet Express)

# fry -> earth
# amy -> mars
# bender -> uranua
# leela -> else

class Pilot
  attr_accessor :name, :deliveries

  def initialize(name)
    self.name = name
    self.deliveries = []
  end

  def bonus
    deliveries.map{|delivery| delivery.money}.reduce(:+) * 0.10
  end

  def trip_count
    deliveries.count
  end
end

fry = Pilot.new("fry")
amy = Pilot.new("amy")
bender = Pilot.new("bender")
leela = Pilot.new("leela")

deliveries.each do |delivery|
  if delivery.destination == "Earth"
    fry.deliveries << delivery
  elsif delivery.destination == "Mars"
    amy.deliveries << delivery
  elsif delivery.destination == "Uranus"
    bender.deliveries << delivery
  else
    leela.deliveries << delivery
  end
end

[fry, amy, bender, leela].each do |pilot|
  puts "#{pilot.name} bonus of #{pilot.bonus} for #{pilot.trip_count} trips"
end


# how much money did we make by planet
# planets = {
#   "Earth" => 0,
#   "Moon" => 0,
#   "Mars" => 0,
#   "Jupiter" => 0,
#   "Uranus" => 0,
#   "Saturn" => 0,
#   "Mercury" => 0,
#   "Pluto" => 0
# }
# deliveries.each do |delivery|
#   planets[delivery.destination] = planets[delivery.destination] + delivery.money
#
#   planets["Mars"] = planet["Mars"] + 50
#
#
# end
#
# pp planets

# how much money did we make by planet

def deliveries_for_planet(deliveries, planet_name)
  deliveries.select do |delivery|
    delivery.destination == planet_name
  end
end

def total_money_for_deliveries(deliveries, planet_name)
  planet_deliveries = deliveries_for_planet(deliveries, planet_name)
  planet_deliveries.map{|delivery| delivery.money}.reduce(:+)
end

deliveries.map{|delivery| delivery.destination}.uniq.each do |name|
  puts "#{name}: #{total_money_for_deliveries deliveries, name} "
end
