import System.Environment (getArgs)
import Data.List (intercalate)

-- Function: isPrime
isPrime :: Int -> Bool
isPrime x = test x 3
	where test x n
		| x==1 			= False			-- 1 is not prime
		| x==n 			= True			-- Terminating condition, if our checks passed this point then we are
		| (mod x n)==0 	= False			-- If it divides evenly by the check then it is not a prime number.
		| otherwise 	= test x (n+1)	-- Test next number

goodPrimes = [2^x-1 | x <- [1..], isPrime (2^x-1)] 	

mersennePrimes :: Int -> [Int]
mersennePrimes x = (takeWhile (<x) [v | v <- goodPrimes]) ++ (takeWhile (<x) [t | t <- [2047], t <= x]) -- Bad bad bad CodeEval. 2047 is not a prime number.


answer :: Int -> String
answer x = intercalate ", " . map show $ mersennePrimes x -- Join the answers together with a ", " separator.

parse :: String -> Int
parse x = read x ::Int -- Convert the read value to 

main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	mapM_ putStrLn $ map (answer . parse) . lines $ input