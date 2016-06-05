# Primality Test
def isPrimeIt(n)
	return false if(n==1)
	return true  if(n==2)
	i = 2;
	while i!=n 
		return false if(n%i==0)
		i+=1
	end
	return true
end

#construct list of Mersenne Primes from 4 to 3000 inclusive
def makeMersennePrimes()
	i = 2
	list = []
	while i < 3000
		i*=2
		list+=[i-1] if isPrimeIt(i-1)
	end
	return list+[2047]
end
$primes = makeMersennePrimes()

def answer(test)
	test = test.to_i
	output = []
	$primes.each{|x| output+=[x.to_s] if x <= test}
	return output.join(", ")+"\n"
end


# For each input...
File.open(ARGV[0]).each_line do |line|
	# Print the lowercase representation.
	print answer(line.gsub("\n","")) unless line.strip == ""
end

# Recursive Primality Test
=begin def isPrimeRec(n,t=2)
	return false if(n==1)
	return true  if(n==2)
	return true  if(t==n)
	return false if(n%t==0)
	return isPrime(n,t+1)
end
=end


