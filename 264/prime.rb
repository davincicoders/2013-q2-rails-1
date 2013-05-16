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
			  if i % x != 0 && x == ((i/2).to_i)
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