import sys
with open(sys.argv[1], 'r') as test_cases:
	# For each input..
    for test in test_cases:
		# Print the lowercase representation.
        print(test.lower())