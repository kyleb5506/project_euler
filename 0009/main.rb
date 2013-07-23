def m_b(x); return 500000%(x-1000); end
def c_v(b); return (-b-500000/(b-1000)); end
def a_v(b,c); return 1000-b-c; end
1.upto(999){|b|
  if m_b(b) == 0
    c = c_v(b)
    a = a_v(b, c)
    if a*c > 0 and a < c and b < c and a < b
      puts "#{a} * #{b} * #{c} = #{a*b*c}\n"
    end
  end
}

