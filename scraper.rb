require 'rubygems'
require 'pry'
require 'csv'
require 'zip'

name = []
file_name = []
zipfile_name = "Fund IIQ 4Q15 PCAP PDFs Q.zip"

## Move Name column data from sheet to name array
CSV.foreach("example2.csv") do |row|
	name << row[2]
end

## Move file name from zip file
Zip::File.open('Fund IIQ 4Q15 PCAP PDFs Q.zip') do |zip_file|
  # Handle entries one by one
  zip_file.each do |entry|
    # if entry.directory?
    #   puts "#{entry.name} is a folder!"
    # elsif entry.symlink?
    #   puts "#{entry.name} is a symlink!"
    # elsif entry.file?
    #   puts "#{entry.name} is a regular file!"
    # else
    #   puts "#{entry.name} is something unknown, oops!"
    # end

    entry_name = entry.name.gsub("KPEO II(Q), LP - 4Q15 Capital Statements - ", "")
    entry_pdf = entry_name.gsub(".pdf", "")

    file_name << entry_pdf
  end
end

name = name.compact

puts name

