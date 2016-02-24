require 'pry'
require 'csv'

zip = []

CSV.foreach("example2.csv") do |row|
	zip << row[2]
end




