require_relative 'prime'

p = PrimeContainer.new()
p.lt_n(2000000)
puts "#{p.sum}"
