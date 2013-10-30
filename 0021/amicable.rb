require_relative 'factor'

def d(n)
  fn = Factorization.new(n)
  return fn.sum
end

def amicable(a)
  b = d(a)
  c = d(b)
  if c == a and b != a
    return b
  else
    return nil
  end
end
