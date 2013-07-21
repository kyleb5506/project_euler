def is_mul_of_two_3digit(num)
  100.upto(Math.sqrt(num)+1){ |x|
    if num % x == 0
      y = num / x
      if y.to_s.scan(/./).map{|m| m.to_i}.size == 3
        return true
      end
    end
  }
  return false
end


