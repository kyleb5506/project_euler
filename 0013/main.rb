require_relative 'big_number'

bg1 = Big_Number.new("0")
bg2 = Big_Number.new("0")
File.open("data.txt", "r") do |fp|
  data = fp.readlines
  data.map{|x| x.chomp}.each{|y|
    bg1 = bg1 + bg2.create_from_string(y)
  }
end
puts "#{bg1.num_array.map{|x| x.to_s}.inject(:+)[0, 10]}"
