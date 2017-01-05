#!/usr/bin/ruby
require "json"
#require libery from directory lib
require_relative 'lib/recive_data'

puts """
    1.Expense
    2.Income
    3.Stat
"""
print "> "
recv = gets.chomp
#show expense def in recive_data.rb
if recv == "1"
  s = Recive_data.new
  s.expense
end
#show income def in recive_data.rb
if recv == "2"
  a = Recive_data.new
  a.income
end
#show generalstat def in recive_data.rb
if recv == "3"
  d = Recive_data.new
  d.generalstat
end
