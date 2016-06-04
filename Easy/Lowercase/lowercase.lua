-- Returns the answer to the test case.
function answer (case)
	-- Return the lowercase result.
	return string.lower(case)
end

for line in io.lines(arg[1]) do
    io.write(answer(line) .. '\n')
end