import System.Environment (getArgs)
import Data.Char (toLower)

main = do
	-- Get command line argument
    args <- getArgs
	-- Open file and get cases
    cases <- readFile (head args)
	-- Map the solution across test cases
    putStr $ map toLower cases