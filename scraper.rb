require 'pry'
require 'csv'

zip = []

CSV.foreach("example2.csv") do |row|
	puts row.inspect
end


puts zip.count


