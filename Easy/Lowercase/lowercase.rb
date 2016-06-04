# For each input...
File.open(ARGV[0]).each_line do |line|
	# Print the lowercase representation.
	puts line.downcase
end