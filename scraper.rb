require 'rubygems'
require 'pry'
require 'csv'
require 'zip'

name = []
file_name = []
output = []
zipfile_name = "Fund IIQ 4Q15 PCAP PDFs Q.zip"

## Move Name column data from sheet to name array
CSV.foreach("example2.csv") do |row|
	name << row[2]
end

## Move file name from zip file
Zip::File.open('Fund IIQ 4Q15 PCAP PDFs Q.zip') do |zip_file|
  # Handle entries one by one
  zip_file.each do |entry|
    entry_name = entry.name.gsub("KPEO II(Q), LP - 4Q15 Capital Statements - ", "")
    entry_pdf = entry_name.gsub(".pdf", "")

    file_name << entry_pdf
  end
end

name = name.compact

# binding.pry

output = name & file_name

puts "#{output} data are fount" unless output.empty?

# if output.empty?
# 	puts "There is no data"
# else
# 	puts "#{output} are found"	
# end
