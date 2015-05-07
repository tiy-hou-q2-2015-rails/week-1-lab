# week-1 Data

## Description

parsing CSV and using classes


## Objectives

### Learning Objectives

After completing this assignment, you should…

* Understand data design
* Deeply understand ruby styles, methods, variables, classes


### Performance Objectives

After completing this assignment, you be able to effectively use

* ruby on the command line
* classes, methods, and data
* comma seperated values (CSV)



## Details

### Deliverables

* A gist containing at least:
  * `planet_express_logs.csv`
  * `data_parser.rb`
  * A Class "Delivery", with the data in the CSV file 

### Requirements


* I should be able to run `ruby data_parser.rb` and see the output on the screen

## Normal Mode

**Good news Rubyists!**  
We have a week of records tracking what we shipped at Planet Express.  I need you to answer a few questions for Hermes.

1. How much money did we make this week?
2. How much of a bonus did each employee get? (bonuses are paid to employees who pilot the Planet Express)
3. How many trips did each employee pilot?
4. Define and use a class for each shipment

Different employees have favorite destinations they always pilot to

* Fry - pilots to Earth (because he isn't allowed into space)
* Amy - pilots to Mars (so she can visit her family)
* Bender - pilots to Uranus (teeheee...)
* Leela - pilots everywhere else because she is the only responsible one

They get a bonus of 10% of the money for the shipment as the bonus
            
## Hard Mode

* Define a class "Parse", with a method `parse_data`, with an argument `file_name`
  and outputs the information to the console
* How much money did we make broken down by planet? ie.. how much did we make shipping to Earth? Mars? Saturn? etc.


## Nightmare Mode

* No methods can be longer than 10 lines long
* Make `data_parser.rb executable` with a command line argument of the file name

> `./data_parser.rb planet_express_logs.csv`


## Notes

File name: `planet_express_logs.csv`
Record format:

> Destination, What got shipped, Number of crates, Money we made

```ruby
require 'csv'
CSV.foreach("planet_express_logs.csv", headers: true) do |row|
  puts row.inspect # replace with your logic
end
```

## Additional Resources

* Read [http://www.nostarch.com/rubywizardry](RubyWizardry) if you feel lost on
  Ruby basics
* [CSV documentation](http://ruby-doc.org/stdlib-2.2.2/libdoc/csv/rdoc/CSV.html)
