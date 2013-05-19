def prime(num)
  primes = [2, 3]
  possible_prime = 4
  until primes.size == num  
    check_point = Math.sqrt(possible_prime).to_i
    catch :next_possible_prime do
  		2.upto(check_point) do |divisor|
        next if divisor != check_point && possible_prime % divisor != 0
  			if divisor == check_point && possible_prime % divisor != 0
          primes.push(possible_prime)
          possible_prime += 1
        else
          possible_prime += 1 
          throw :next_possible_prime
        end
  		end
		end
  end
	puts primes[-1]
end

prime 10001