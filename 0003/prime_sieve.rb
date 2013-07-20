def is_prime?(num)
  if num == 2
    return true
  else
    2.upto(Math.sqrt(num)){|x| if num % x == 0; return false; end}
    return true
  end
end

class Prime
  @prime = 2
  @index = 0
  
  def initialize(start_index=0)
    @prime = 2
    @index = 0
    if(start_index > 0)
      while @index != start_index do
        self.next_prime
      end
    end
  end
  
  def next_prime()
    if @prime == 2
      @prime = 3
      @index += 1
      return @prime
    else
      while true do
        @prime += 2
        if is_prime?(@prime)
          @index += 1
          break
        end
      end
      return @prime
    end
  end
  
  def prime
    return @prime
  end
  
  def index
    return @index
  end
end
