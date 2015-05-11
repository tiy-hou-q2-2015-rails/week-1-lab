require 'pp'
require 'csv'

class Delivery
  attr_accessor :destination, :money
end

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

class Parse

  attr_accessor :deliveries

  def initialize
    self.deliveries = []

    CSV.foreach("./planet_express_logs.csv", headers: true) do |row|
      data = row.to_hash
      delivery = Delivery.new
      delivery.destination = data["Destination"]
      delivery.money = data["Money we made"].to_f
      self.deliveries << delivery
    end

  end

  def parse


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

    deliveries.map{|delivery| delivery.destination}.uniq.each do |name|
      puts "#{name}: #{total_money_for_deliveries name} "
    end

  end

  def deliveries_for_planet(planet_name)
    deliveries.select do |delivery|
      delivery.destination == planet_name
    end
  end

  def total_money_for_deliveries(planet_name)
    planet_deliveries = deliveries_for_planet(planet_name)
    planet_deliveries.map{|delivery| delivery.money}.reduce(:+)
  end

end

p = Parse.new
p.parse
