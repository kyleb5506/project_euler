
a = []
File.open("data.txt", "r") do |log|
  log.readlines.each{ |line|
    line.chomp!
    a.push(line.split(/ /).map{|x| x.to_i})
  }
end

n = a.size
max = 0
n.times do |r|
  n.times do |c|
    dn=0; rg=0; ld=0; rd=0
    if (r+3) < n; dn = [a[r][c], a[r+1][c], a[r+2][c], a[r+3][c]].inject(:*); end
    if (c+3) < n; rg = [a[r][c], a[r][c+1], a[r][c+2], a[r][c+3]].inject(:*); end
    if (r+3) < n and (c-3) >=0; ld = [a[r][c], a[r+1][c-1], a[r+2][c-2], a[r+3][c-3]].inject(:*); end
    if (r+3) < n and (c+3) < n; rd = [a[r][c], a[r+1][c+1], a[r+2][c+2], a[r+3][c+3]].inject(:*); end
    p_max = [dn, rg, ld, rd].max
    max = (p_max > max) ? p_max : max
  end
end
puts "#{max}"
