fp = File.open("names.txt")
names = fp.readline.chomp.split(',').map{|x| x=x.gsub(/"/, "");}.sort
sum = (1..names.size).map{|x|
  x=x*names[x-1].chars.map(&:ord).map{|s| s=s-64;}.inject(:+);
}.inject(:+);
puts "#{sum}"


names = File.open('names.txt').readline.chomp.split(',').map{|x| x.gsub(/"/, "");}.sort.map{|x| x.chars.map(&:ord).map{|s| s-64;}.inject(:+);}.each_with_index.map{|val, ind| val*(ind+1);}.inject(:+);
puts "#{names}"
