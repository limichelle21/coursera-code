def make_equal(num, mid, size)
  string = num.to_s.rjust(size, '0')
  return string.slice(0...mid).to_i, string.slice(mid..-1).to_i
end

def karatsuba(num1, num2)
    return num1 * num2 if num1 < 10 || num2 < 10
    size = [num1.to_s.length, num2.to_s.length].max
    n = size/2
    k = (size + 1) / 2
    
    high1,low1 = make_equal(num1, k, size)
    high2,low2 = make_equal(num2, k, size)
  
    z0 = karatsuba(low1,low2)
    z1 = karatsuba((low1 + high1), (low2 + high2))
    z2 = karatsuba(high1,high2)
    z3 = z1-z0-z2
    
  return z2 * 10**(2*n) + ((z3) * 10**(n)) + z0
end


