import System.Environment (getArgs)
import Data.List (intercalate)

fizzBuzz :: [Int] -> String
fizzBuzz xs = answer (xs!!0) (xs!!1) [(xs!!2),((xs!!2) - 1)..1] []
	where answer a b cs output
		| cs == [] = intercalate " " output
		| mod (head cs) a == 0 && mod (head cs) b == 0  = answer a b (tail cs) ("FB":output)
		| mod (head cs) a == 0 							= answer a b (tail cs) ("F":output)
		| mod (head cs) b == 0 							= answer a b (tail cs) ("B":output)
		| otherwise 									= answer a b (tail cs) ((show (head cs)):output)
		
main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	mapM_ (putStrLn . fizzBuzz . (map (\v-> read v ::Int)) . (words)) (lines input)