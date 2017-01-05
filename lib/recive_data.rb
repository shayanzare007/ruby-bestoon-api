#!/usr/bin/ruby

require "json"

class Recive_data
	#def generalstat
	def generalstat
		host = "http://bestoon.ir"
		#token
		token = "kgfqN5pRwNYXghqYeUdFHntRyisWTshYvylRko9E8TZeMtqU"
		#income bestton api directory
		income = "/submit/income/ "
		#generalstate bestoon api directory
		generalstate = "/q/generalstat/"
		#send data from curl linux
	  system("curl --data \"token=#{token}\" #{host}#{generalstate} > .json_file/generalstate.json")
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
	end
end
