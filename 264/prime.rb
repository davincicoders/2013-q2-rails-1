def prime(num)
  primes = []
  i = 2
  while (i / 2) < 2
	  primes.push(i)
	  i += 1
	  break if primes.size == num
	end
	until primes.size == num
		2.upto(Math.sqrt(i).to_i) do |x|
			if x == Math.sqrt(i).to_i && i % x != 0
        primes.push(i)
        i += 1
        break
      elsif i % x != 0
        next
      else
      i += 1 
      break
      end
		  end
		end
	puts primes[-1]
end

prime 10001