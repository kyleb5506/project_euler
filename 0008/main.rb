
s = ''
File.open("data.txt", "r") do |log|
  log.readlines.each{ |line|
    line.chomp!
    s += line
  }
end
n = s.scan(/./).collect{|x| x.to_i}
c = []; z = 0; count = 0; max = 0
while n.size > 0 do
  if c.size == 5 and count == 0
    mul = c.inject(:*)
    max = (mul > max) ? mul : max
  end
  if count > 0; count -= 1; end
  c.push(z=n.shift)
  if c.size > 5; c.shift; end
  count = (z==0) ? 5 : count
end
puts "#{max}"
