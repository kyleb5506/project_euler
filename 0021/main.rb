require_relative 'amicable'

amicable_numbers = []
1.upto(10000){|x|
  y = amicable(x)
  if y != nil
    if !amicable_numbers.include?(x)
      amicable_numbers.push(x)
    end
    if !amicable_numbers.include?(y)
      amicable_numbers.push(y)
    end
  end
}

puts "#{amicable_numbers.inject(:+)}"
