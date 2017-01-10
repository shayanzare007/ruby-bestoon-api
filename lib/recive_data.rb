#!/usr/bin/rubyS

require "json"
require "colorize"
require "net/http"

class Recive_data
	######################
	# => Set your token
	$token = 'test'		#Global variable
	#
	######################

	#def generalstat
	def generalstat
		#recive data with get method
		uri = URI('http://bestoon.ir/q/generalstat/')
		#SET YOUR TOKEN
		res = Net::HTTP.post_form(uri, 'token' => $token)
		#parsing and read json file
		parsed = JSON.parse(res.body)
		parsed["expense"].each do |s|
		    print "Expense: ".blue
				p s[1]
		end
		puts "---------"
		parsed["income"].each do |i|
		  print "Income: ".blue
		  p i[1]
		end
	end
	#def expense
	def expense
		#token = "kgfqN5pRwNYXghqYeUdFHntRyisWTshYvylRko9E8TZeMtqU"
		puts "Enter your Amount: "
		am = gets.chomp
		puts "Enter your Description: "
		dec = gets.chomp
		#send post request
		uri = URI.parse("http://bestoon.ir/submit/expense/")

		res = Net::HTTP.post_form(uri, 'token' => $token, 'amount' => am , 'text' => dec)
		puts "\n"
		puts res.body.red
		puts "\n"
		print "\nDo you want to show all The sum of all transactions?(y,n)"
		sum = gets.chomp
		if sum == "y"
			generalstat
		end
	end
	#def income
	def income

		puts "Enter your income: "
		inc = gets.chomp
		puts "Enter your Description: "
		dec = gets.chomp

		#send post request
		uri = URI.parse("http://bestoon.ir/submit/expense/")

		res = Net::HTTP.post_form(uri, 'token' => $token, 'amount' => inc , 'text' => dec)
		puts "\n"
		puts res.body.red
		puts "\n"

		print "\nDo you want to show all The sum of all transactions?(y,n)"
		sum = gets.chomp
		if sum == "y"
			generalstat
		end
	end
end
