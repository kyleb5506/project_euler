require_relative 'prime_sieve'

def prime_factorization(num)
  prime = Prime.new()
  factors = {}
  product = num
  factorization = []
  if is_prime?(num)
    factorization.push(num)
    return factorization
  end
  while product != 1 do
    puts product
    if product % prime.prime == 0
      product /= prime.prime
      factorization.push(prime.prime)
    else
      prime.next_prime
    end
  end
  return factorization
end
