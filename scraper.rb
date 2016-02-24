require 'pry'
require 'csv'

zip = []
user_rating = []

CSV.foreach("internet-providers.csv") do |row|
	zip << row[0]
	user_rating << row[3]
	puts "#{zip} && #{user_rating}"
end

binding.pry

puts zip


