import Data.List (intercalate)

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