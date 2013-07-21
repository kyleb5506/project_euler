require_relative 'prime_sieve'

def prime_factorization(num)
  prime = Prime.new()
  product = num
  factorization = []
  if is_prime?(num)
    factorization.push(num)
    return factorization
  end
  while product != 1 do
    if product % prime.prime == 0
      product /= prime.prime
      factorization.push(prime.prime)
    else
      prime.next_prime
    end
  end
  return factorization
end

def map_prime_factorization(num)
  prime = Prime.new()
  product = num
  factorization = {}
  if is_prime?(num)
    factorization[num] = 1
    return factorization
  end
  while product != 1 do
    if product % prime.prime == 0
      product /= prime.prime
      if factorization.has_key?(prime.prime)
        factorization[prime.prime] += 1
      else
        factorization[prime.prime] = 1
      end
    else
      prime.next_prime
    end
  end
  return factorization
end
