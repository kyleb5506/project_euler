require_relative 'palindrome'
require_relative 'factor'

myp = Palindrome.new(998001, 10000, 998001, -1)

tmp = myp.number
while true do
  if is_mul_of_two_3digit(tmp)
    puts tmp
    break
  elsif tmp == -1
    puts "Lowest Palindrome Reached #{myp.number}"
    break
  end
  tmp = myp.next_palindrome
end
