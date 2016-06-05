import System.Environment (getArgs)
import Data.List (intercalate)
import Data.Set (Set, fromList, unions, toList, member)

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
		

answer :: ([Set Int],[Int]) -> String
answer x = intercalate " " (map (\v->(intercalate "," ( words ((show v)++":"++(solution (fst x) v))))++";") (snd x))

solution :: [Set Int] -> Int -> String
solution xs x = helper x xs 1
	where helper b bs pos
		| bs == [] = ""
		| member b (head bs) && (tail bs) == [] = (show pos)++ (helper b (tail bs) (pos+1))
		| member b (head bs) = (show pos)++" "++ (helper b (tail bs) (pos+1))
		| otherwise = helper b (tail bs) (pos+1)

parse :: String -> ([Set Int],[Int])
parse x = (parsed, toList (unions parsed))
	where parsed = Prelude.map (fromList) (Prelude.map (Prelude.map (\v->read v ::Int)) (Prelude.map words (splitString "|" x)))

main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	mapM_ putStrLn $ map (answer . parse) . lines $ input
	
test = "1 2 3 4 | 3 1 | 4 1"