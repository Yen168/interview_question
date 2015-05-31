
require 'csv'
require './person'

people = []
hash_save = []

CSV.foreach("input.csv", headers: true,header_converters: :symbol) do |row|
   hash_save.push(row.to_hash)
   
   people.push(Person.new(row.to_hash))
   
end


search = [year: "1999"]
search2 = [year: "1999", :model=>"T210"]



def hashQ(hash_save,search)
	
	result_list = []
	#hash_save.find_all do |h|
	hash_save.each do |h|
		
		result = true

		search.each {|hh| hh.each {|k,v| result = false if h[k] !=v}}
		result_list.push(h) if result != false
		#result_list << h if result != false

	end
	result_list
end

k = hashQ(hash_save,search)
puts k

k2 = hashQ(hash_save,search2)
puts k2
