module Logic
  def Logic.adder(x, y, co=0)
    z = x + y + co
    c = z.to_s.scan(/./).map{|i| i.to_i}
    (c.size == 2) ? c : [0] + c
  end
end
