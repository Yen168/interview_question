
require 'csv'
require 'psr'
require './person'

people = []

CSV.foreach("input.csv", headers: true,header_converters: :symbol) do |row|
   p row.to_hash
   people.push(Person.new(row.to_hash))
   
end

p people
