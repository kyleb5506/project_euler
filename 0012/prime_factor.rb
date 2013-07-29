require_relative 'prime'

class PrimeFactorization
  @prime = ::PrimeContainer.new()
  @prime_factors = []
  @prime_number = 0
  
  def initialize(num=0)
    @prime = ::PrimeContainer.new()
    @prime_factors = []
    @prime_number = 0
    
    self.set_number(num)
  end
  
  def set_number(num)
    if num <= 2
      @prime_number = num
      @prime_factors = []
      @prime = ::PrimeContainer.new()
      return []
    elsif num == 2
      @prime_number = 2
      @prime_factors = [2]
      @prime = ::PrimeContainer.new()
      return @factors
    else
      @prime_number = num
      @prime_factors.clear
      @prime.lteq_n(num/2).each{|x|
        while num % x == 0 do
          num /= x
          @prime_factors.push(x)
        end
      }
      if @prime.check(@prime_number) and not @prime_factors.include?(@prime_number)
        @prime_factors.push(@prime_number)
      end
      @prime_factors.sort!
      return @prime_factors
    end
  end
  
  def number
    return @prime_number
  end
  
  def prime_factors
    return @prime_factors
  end
  
  def prime_factors_map
    fmap = {}
    @prime_factors.each{|x| fmap.keys.include?(x) ? fmap[x]+=1 : fmap[x] = 1}
    return fmap
  end
end
