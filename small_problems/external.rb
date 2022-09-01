# create an Enumerator that can iterate over an infinite list of factorials.
require 'pry'

fact = Enumerator.new do |num|
  start = 0
  sum = 1
  loop do
    binding.pry
    sum = start.zero? ? 1 : sum * start
    num << sum
    start += 1
  end
end

0.upto(10) { |n| puts "#{n}! == #{fact.next}" }
6.times { |n| puts "#{n}! == #{fact.next}" }
fact.rewind
6.times { |n| puts "#{n}! == #{fact.next}" }

fact.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end