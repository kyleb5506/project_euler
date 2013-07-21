require_relative 'prime_factor'

num = 1
pow_map = {}

range = 2..20

range.each{|x|
  factors = map_prime_factorization(x)
  factors.keys.each{|y|
    if pow_map.has_key?(y)
      if pow_map[y] < factors[y]
        pow_map[y] = factors[y]
      end
    else
      pow_map[y] = factors[y]
    end
  }
}

pow_map.keys.each{|x|
  num *= (x ** pow_map[x])
}

puts num
