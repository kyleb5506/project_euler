
class PrimeContainer
  @primes = []
  @index = 0
  
  def initialize(start_index=1)
    @primes = [2]
    @index = 1
    while @index != start_index do
      self.next_prime
    end
  end
  
  def next_prime
    if @primes[@index-1] == 2
      @primes.push(3)
      @index += 1
      return @prime
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
  
  def prime
    return @primes[@index-1]
  end
  
  def index
    return @index
  end
  
  def ith_prime(index)
    if index > 0
      while @index < index
        self.next_prime
      end
      return @primes[index-1]
    else
      return nil
    end
  end
end
