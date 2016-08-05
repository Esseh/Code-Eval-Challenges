import System.Environment (getArgs)
import Data.List (intercalate)
		
answer :: [String] -> String
answer x = intercalate " " (reverse x)
	
parse :: String -> [String]
parse x = words x
	
main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	mapM_ (putStrLn . answer . parse) $ (lines input)