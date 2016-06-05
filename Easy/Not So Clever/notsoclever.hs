import System.Environment (getArgs)
import Data.List (intercalate)
----------------------------
-- HELPERS
----------------------------
-- Splits a string with a separator into multiple substrings.

split :: String -> String -> [String]
split sep s
	| (find sep (words s)) == -1 = [s]
	| otherwise = [intercalate " " (fst r)] ++ (split sep (intercalate " " (tail (snd r))))
		where r = splitAt ((find sep (words s))) (words s) 

find :: String -> [String] -> Int
find x xs = helper 0 x xs
	where helper pos b bs
		| bs == [] = -1
		| b == head bs = pos
		| otherwise = helper (pos+1) b (tail bs)
----------------------------

iteration :: String -> String
iteration inp = init (runIteration (words inp) False)
	where runIteration list swapped
		-- Empty List Return a blank string. (Terminating Condition)
		| list == [] = ""		
		-- If we're one element from the end and are still looking ahead then we should stop looking ahead.
		| (tail list) == [] && swapped == False = runIteration list True
		-- If its time to swap then swap.
		| swapped == False && (read (head list) ::Int) > (read (head (tail list)) ::Int) = (head (tail list)) ++ " " ++ (head list) ++ " " ++ runIteration (tail (tail list)) True
		-- If everything is fine just append the head and continue.
		| otherwise = (head list) ++ " " ++ runIteration (tail list) swapped 

stupidSort :: String -> Int -> String
stupidSort inp it
	| it == 0 = inp
	| otherwise = stupidSort (iteration inp) (it-1)

answer :: [String] -> String
answer x = stupidSort (x!!0) (read (x!!1) ::Int)

parse :: String -> [String]
parse x = split "|" x

main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	mapM_ putStrLn $  map (answer . parse) (lines input)

testCases = "4 3 2 1 | 1\n5 4 3 2 1 | 2"
run x = map (answer . parse) (lines x)