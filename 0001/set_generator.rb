require 'set'

class SetV < Set
  def initialize()
    super()
  end
  def create_set_multiples(start, finish, factor)
    range = (start)..(finish-1)
    range.step(factor){|x| self.add(x)}
    return nil
  end
  def sum(); return self.to_a.inject(0, :+); end
end

def sum_of_multiples(start, finish, factors)
  final_set = SetV.new()
  factors.each do |var|
    tmp_set = SetV.new()
    tmp_set.create_set_multiples(start, finish, var)
    final_set = final_set|tmp_set
  end
  return final_set.sum
end
