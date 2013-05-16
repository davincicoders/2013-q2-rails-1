def prime num
  primes = []
  i = 2
		while (i / 2) < 2
			primes.push(i)
			i += 1
			break if primes.size == num
		end
		until primes.size == num
		2.upto(i / 2) do |x|
			  if i % x != 0
			  	next
			else
				i += 1 
				primes.push(i)
				i += 1
			end
			next
		end
	end
	puts primes[-1]
end







