def collatz(n, count=0)
  if n == 1
    return count
  else
    if n % 2 == 0
      return collatz(n/2, count+1)
    else
      return collatz(3*n+1, count+1)
    end
  end
end

def main()
  max = 0
  var = 0
  2.upto(1000000){|x|
    value = collatz(x)
    if value > max
      var = x
      max = value
    end
  }
  puts "#{var}"
end

main()
