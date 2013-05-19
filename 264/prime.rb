def prime(num)
  primes = [2, 3]
  i = 4
  until primes.size == num
		2.upto(Math.sqrt(i).to_i) do |x| 
			if x == Math.sqrt(i).to_i && i % x != 0
        primes.push(i)
        i += 1
      elsif i % x != 0
      else
      i += 1 
      break
      end
		  end
		end
	puts primes[-1]
end

prime 10001