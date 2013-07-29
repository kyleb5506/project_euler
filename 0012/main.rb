require_relative 'factor'
require_relative 'triangle'

limit = 500
fctr = Factorization.new()
count = 0
tri = 0
while fctr.factorize(tri = triangle(count)).size <= limit do
  count += 1
end
puts "#{tri}"
