Week 1 Lab - Data
================

File name: `planet_express_logs.txt`
Record format:

```
Destination, What got shipped, Number of crates, Money we made
```

### Good news Rubyists!
* We have a week of records tracking what we shipped at Planet Express.
* I need you to answer a few questions for Hermes.

1. How much money did we make this week?
2. Also, bonuses are paid to employees who pilot the Planet Express

* Different employees have favorite destinations they always pilot to
* Fry - pilots to Earth (because he isn't allowed into space)
* Amy - pilots to Mars (so she can visit her family)
* Bender - pilots to Uranus (teeheee...)
* Leela - pilots everywhere else because she is the only responsible one

3. How many trips did each employee pilot?

* They get a bonus of 10% of the money for the shipment as the bonus
* How much of a bonus did each employee get?

4. BONUS 1

* How much money did we make broken down by planet?
* ie.. how much did we make shipping to Earth? Mars? Saturn? etc.

5. BONUS 2 - uses classes for each shipment; but not necessary

* Classes will be covered Thursday

```ruby
open("planet_express_logs.txt").each do |line|
  string_data = line.chomp
  * process string_data here
end
```


Submitting Lab
==========

1. Create a Gist with your file that reads and processes data
2. Submit a link to your Gist as an issue here
3. Due: Monday, January 12th, 6:00 AM

