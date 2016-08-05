import System.Environment (getArgs)
import Data.List (intercalate)

------------------------------------
-- Helpers
------------------------------------
-- Splits a string with a separator into multiple substrings.
splitString :: String -> String -> [String]
splitString sep s
	| (find sep (words s)) == -1 = [s]
	| otherwise = [intercalate " " (fst r)] ++ (splitString sep (intercalate " " (tail (snd r))))
		where r = splitAt ((find sep (words s))) (words s) 

find :: String -> [String] -> Int
find x xs = helper 0 x xs
	where helper pos b bs
		| bs == [] = -1
		| b == head bs = pos
		| otherwise = helper (pos+1) b (tail bs)

boolToInt :: Bool -> Int
boolToInt x = if x == False then 0 else 1

answer :: String -> String
answer x 
	| r == 0 = "Done"
	| r <= 2 = "Low"
	| r <= 4 = "Medium"
	| r <= 6 = "High"
	| otherwise = "Critical"
	where r = sum (zipWith (\x y -> boolToInt (x/=y)) input design)
	      input  = parsed!!0
	      design = parsed!!1
	      parsed = splitString "|" x

main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	mapM_ putStrLn $ map answer . lines $ input
	
	
testCases = "Heelo Codevval | Hello Codeeval\nhELLO cODEEVAL | Hello Codeeval\nHello Codeeval | Hello Codeeval"
run x = map answer . lines $ x