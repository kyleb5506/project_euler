
def is_prime?(num)
  Math.sqrt(num).downto(2){|x| if num % x == 0; return false}
  return true
end

class PrimeContainer
  @primes = []
  @index = 0
  
  def initialize(start_index=0)
    @primes = []
    @index = 0
    while @index != start_index do
      self.next_prime
    end
  end
  
  def next_prime
    if @primes.size == 0
      @primes.push(2)
      @index = 1
      return @primes[@index-1]
    elsif @primes[@index-1] == 2
      @primes.push(3)
      @index = 2
      return @primes[@index-1]
    else
      num = @primes[@index-1]
      is_prime = true
      begin
        num += 2
        sqrt = Math.sqrt(num)
        is_prime = true
        @primes.each{|x|
          if x > sqrt; break; end
          if num % x == 0
            is_prime = false
            break
          end
        }
      end while not is_prime
      @primes.push(num)
      @index += 1
      return @primes[@index-1]
    end
  end
  
  def lt_n(num)
    if num > 2
      if @index == 0 or @primes[@index-1] < num
        flag = false
        while self.next_prime < num do; flag = true; end
        if flag; self.pop; end
      else
        while self.prime > num do; self.pop; end
      end
    else
      @primes = []
      @index = 0
    end
    return @primes
  end
  
  def lteq_n(num)
    if num > 2
      if @index == 0 or @primes[@index-1] < num
        flag = false
        while self.next_prime <= num do; flag = true; end
        if flag; self.pop; end
      else
        while self.prime > num do; self.pop; end
      end
    else
      @primes = []
      @index = 0
    end
    return @primes
  end
  
  def prime
    return @primes[@index-1]
  end
  
  def primes
    return @primes
  end
  
  def index
    return @index
  end
  
  def sum()
    return @primes.inject(:+)
  end
  
  def product()
    return @primes.inject(:*)
  end
  
  def pop
    if @primes.size > 0
      @index -= 1
      return @primes.pop()
    else
      return nil
    end
  end
  
  def clear
    @primes = []
    @index = 0
  end
  
  def ith_prime(index)
    if index <= 0
      return nil
    elsif index > 0 and index > @index
      while @index < index
        self.next_prime
      end
      return @primes[@index-1]
    elsif index > 0 and index < @index
      while @index > index
        self.pop
      end
      return @primes[@index-1]
    else
      return nil
    end
  end
  
  def check(num)
    self.lteq_n(num)
    return @primes.include?(num)
  end

end

