class Factorization
  @factors = []
  @number = 0
  
  def initialize(num=0)
    @factors = []
    @number = 0
    self.factorize(num)
  end
  
  def factorize(num=0)
    if num == 0
      @number = num; @factors = []
    elsif num == 1
      @number = num; @factors = [1]
    else
      sqrt = Math.sqrt(num)
      @number = num
      @factors = 1.upto(sqrt).to_a.select{|x| num % x == 0}.collect{|y| (num/y==y) ? [y] : [y, num/y]}.inject(:+)
      return @factors
    end
  end
  
  def factors
    return @factors
  end
  
  def size
    return @factors.size
  end
  
  def number
    return @number
  end
  
  def sum
    if @factors.size > 0
      return (@factors.inject(:+) - @number)
    else
      return 0
    end
  end
end

