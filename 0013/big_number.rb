require_relative 'adder'

class Big_Number
  @num_array = []
  def initialize(s_num = "")
    self.create_from_string(s_num)
  end
  def create_from_string(s_num="")
    @num_array = s_num.scan(/./).map{|x| x.to_i}
    return self
  end
  def create_from_array(arr=[])
    @num_array = arr
    return self
  end
  def digits
    return @num_array.size
  end
  def num_array
    return @num_array
  end
  def +(y)
    result = self.dup
    result.add(y)
    return result
  end
  def add(y)
    a = []; b = []; c = []
    co = 0; i = 0
    diff = y.digits - self.digits
    if diff == 0
      a = y.num_array.reverse; b = @num_array.reverse
    elsif diff < 0
      a = (::Array[0]*diff.abs + y.num_array).reverse; b = (@num_array).reverse
    else
      a = (y.num_array).reverse; b = (::Array[0]*diff.abs + @num_array).reverse
    end
    a.each_index{|x|
      i = Logic.adder(a[x], b[x], co)
      c.push(i[1]); co=i[0]
    }
    if co != 0; c.push(co); end
    co = 0
    @num_array = c.reverse
    return self
  end
end
