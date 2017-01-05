#!/usr/bin/rubyS

require "json"
require "colorize"

class Recive_data
	#def generalstat
	def generalstat
		host = "http://bestoon.ir"
		#token
		token = "kgfqN5pRwNYXghqYeUdFHntRyisWTshYvylRko9E8TZeMtqU"
		#generalstate bestoon api directory
		generalstate = "/q/generalstat/"
		#send data from curl linux
	  system("curl --data \"token=#{token}\" #{host}#{generalstate} > json_file/generalstate.json")
		#Reading json file
		file = File.open("json_file/generalstate.json")
		json = file.read
		#paes json
		parsed = JSON.parse(json)
		parsed["expense"].each do |s|
			print "\n\nExpense: "
			p s[1]
		end
		parsed["income"].each do |i|
			print "Income: "
			p i[1]
		end
	end
	#def expense
	def expense
		token = "kgfqN5pRwNYXghqYeUdFHntRyisWTshYvylRko9E8TZeMtqU"
		#expense bestoon api directory
		expense = "/submit/expense/"
		host = "http://bestoon.ir"

		puts "Enter your Amount: "
		am = gets.chomp
		puts "Enter your Description: "
		dec = gets.chomp
		#send data from curl linux
		system("curl --data \"token=#{token}&amount=#{am}&text=#{dec}\" #{host}#{expense} > json_file/expense.json")

		print "\nDo you want to show all The sum of all transactions?(y,n)"
		sum = gets.chomp
		if sum == "y"
			generalstat
		end
	end
	#def income
	def income
		token = "kgfqN5pRwNYXghqYeUdFHntRyisWTshYvylRko9E8TZeMtqU"
		income = "/submit/income/"
		host = "http://bestoon.ir"

		puts "Enter your income: "
		inc = gets.chomp
		puts "Enter your Description: "
		dec = gets.chomp
		#send data from curl linux
		system("curl --data \"token=#{token}&amount=#{inc}&text=#{dec}\" #{host}#{income} > json_file/income.json")
		print "\nDo you want to show all The sum of all transactions?(y,n)"
		sum = gets.chomp
		if sum == "y"
			generalstat
		end
	end
end
