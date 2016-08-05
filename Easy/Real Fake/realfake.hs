import System.Environment (getArgs)
import Data.List (intercalate)
import Data.Char (digitToInt)
		
answer :: String -> String
answer x
	| mod (sum (zipWith (*) (cycle [2,1]) (map (digitToInt) (intercalate "" (words x))))) 10 == 0 = "Real"
	| otherwise = "Fake"
	
main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	mapM_ putStrLn $ map (answer) . lines $ input