require 'pry'
require 'csv'
require 'zipruby'

zip = []

CSV.foreach("example2.csv") do |row|
	zip << row[2]
end

Zip::Archive.open('Fund IIQ 4Q15 PCAP PDFs Q (2).zip') do |ar|
	binding.pry
   # ar.fopen('article.txt') do |f|
   #    content = f.read
   #    # do sth
   end
end


