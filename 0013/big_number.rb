
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
    co = 0; i = 0; d = 0
    if y.digits > self.digits
      a = y.num_array.reverse; b = self.num_array.reverse
    else
      a = self.num_array.reverse; b = y.num_array.reverse
    end
    a.each_index{|x|
      i = a[x] + ((x < b.size) ? b[x] : 0) + co
      d = i.to_s.scan(/./).map{|y| y.to_i}
      if d.size == 2
        co = d[0]
        c.push(d[1])
      else
        co = 0
        c.push(d[0])
      end
    }
    if co != 0; c.push(co); end
    co = 0
    @num_array = c.reverse
    return self
  end
end
