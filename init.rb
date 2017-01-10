#!/usr/bin/ruby

require "json"
require "colorize"
#require libery from directory lib
require_relative 'lib/recive_data'


#Reading logo from file
file = File.open("files/logo.txt" , 'r') do |s|
  s.each_line do |line|
    puts line
  end
end

puts """

    1.Expense
    2.Income
    3.Stat
""".yellow
#start loop for dont exit if wrong command
loop {
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
  #exit programm
  if recv == "exit"
    puts "Exiting Programm Good Luck :)".red
    exit
  end
}#end loop
