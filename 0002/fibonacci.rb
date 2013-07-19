
def sum_fibonacci(max, last=[], sum=0, index=0)
  if index == 0 or index == 1
    last.push(1)
    index += 1
    return sum_fibonacci(max, last, sum, index)
  elsif last.inject(0, :+) >= max
    return sum
  else
    sum = sum + (((index - 2) % 3 == 0) ? last.inject(0, :+) : 0)
    last.push(last.inject(0, :+))
    last.shift
    index += 1
    return sum_fibonacci(max, last, sum, index)
  end
end
