
class Palindrome
  @n_d = 0
  @a_d = []
  @lb = 0
  @ub = 0
  @dir = -1
  def initialize(num, lower_bound, upper_bound, direction=-1)
    @a_d = (num > 0) ? num.to_s.scan(/./).map{|x| x.to_i} : []
    @n_d = @a_d.size
    @lb = (lower_bound > 0) ? lower_bound : 0
    @ub = (upper_bound > 0 and upper_bound >= lower_bound) ? upper_bound : lower_bound
    @dir = (direction == -1 or direction == 1) ? direction : -1
    self.next_palindrome
  end
  
  def number(digit=@n_d, array=@a_d)
    num = 0
    for each in array
      num += (each * (10 ** (digit-1)))
      digit -= 1
    end
    return num
  end
  
  def digits; return @n_d; end
  def lower_bound; return @lb; end
  def upper_bound; return @ub; end
  
  #Finds the next palindrome defined by the range (lower to upper) and the direction
  def next_palindrome
    a = []; b = []
    a = (@n_d % 2 == 0) ? @a_d[0..(@n_d/2-1)] : @a_d[0..(@n_d/2-1)]
    b = (@n_d % 2 == 0) ? @a_d[(@n_d/2)..(@n_d-1)] : @a_d[(@n_d/2)..(@n_d-1)]
    size = a.size
    new_num = self.number(a.size, a)+@dir
    a = (new_num).to_s.scan(/./).map{|x| x.to_i}
    if a.size > size
      if a > self.upper_bound
        return -1
      end
      @n_d += 1
      @a_d.clear
      @a_d.push(1)
      (@n_d-1).times{|x| @a_d.push(0)}
      return self.next_palindrome
    elsif a.size < size
      if new_num < self.lower_bound or new_num == 0
        return -1
      end
      @n_d -= 1
      @a_d.clear
      @n_d.times{|x| @a_d.push(9)}
      return self.next_palindrome
    end
    @a_d.clear
    b = a.reverse
    if @n_d % 2 != 0; b.shift; end
    num = self.number((a+b).size, a+b)
    if lower_bound <= num and num <= upper_bound
      @a_d = a + b
      @n_d = @a_d.size
      return self.number
    else
      return -1
    end
  end
  
  def is_palindrome?
    return @a_d == @a_d.reverse
  end
end
