require 'rubygems'
require 'pry'
require 'csv'
require 'zip'


zip = []
file_name = []
zipfile_name = "Fund IIQ 4Q15 PCAP PDFs Q.zip"

CSV.foreach("example2.csv") do |row|
	zip << row[2]
end

Zip::File.open('Fund IIQ 4Q15 PCAP PDFs Q.zip') do |zip_file|
  # Handle entries one by one
  zip_file.each do |entry|
    if entry.directory?
      puts "#{entry.name} is a folder!"
    elsif entry.symlink?
      puts "#{entry.name} is a symlink!"
    elsif entry.file?
      puts "#{entry.name} is a regular file!"
    else
      puts "#{entry.name} is something unknown, oops!"
    end

    name = entry.name.gsub("KPEO II(Q), LP - 4Q15 Capital Statements - ", "")
    pdf = name.gsub(".pdf", "")

    file_name << pdf
  end
end



