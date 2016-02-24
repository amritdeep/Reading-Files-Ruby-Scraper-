require 'pry'
require 'csv'

zip = []
user_rating = []

CSV.foreach("example.csv") do |row|
	binding.pry
	zip << row[0]
	# user_rating << row[3]
end

binding.pry

puts zip


