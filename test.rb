require 'csv'

datatest = {1,2,3}
 CSV.open("data.csv", "wb") {|csv| datatest.each {|elem| csv << elem} }