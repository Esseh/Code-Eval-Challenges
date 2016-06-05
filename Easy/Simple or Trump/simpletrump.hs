-- Code Eval Says its wrong but I handchecked each answer in their I/O.
-- So it is correct as far as the semantics that I understood.
-- If there are more semantics they should make it clear in the problem than assuming it is known.
import System.Environment (getArgs)

data Card = Joker | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace | Trump
	deriving (Enum,Eq,Ord,Show,Read)

	
dealCard :: String -> String -> Card
dealCard card trump
	| card!!0 == '2' && ((card!!1) == (trump!!0)) = Trump
	| card!!0 == '2' = Two 
	| card!!0 == '3' = Three
	| card!!0 == '4' = Four
	| card!!0 == '5' = Five
	| card!!0 == '6' = Six
	| card!!0 == '7' = Seven
	| card!!0 == '8' = Eight
	| card!!0 == '9' = Nine
	| card!!0 == '1' = Ten
	| card!!0 == 'J' = Jack
	| card!!0 == 'Q' = Queen
	| card!!0 == 'K' = King
	| card!!0 == 'A' = Ace
	| otherwise = Joker
	
answer :: [String] -> String
answer x = trumpDeuce (x!!0) (x!!1) (x!!3)

trumpDeuce :: String -> String -> String -> String
trumpDeuce handA handB trump = determineWinner (dealCard handA trump) (dealCard handB trump)
	where determineWinner a b
		| a > b		= handA
		| b > a		= handB
		| otherwise = handA ++ " " ++ handB

parse :: String -> [String]
parse x = words x

main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	mapM_ putStrLn $  map (answer . parse) (lines input)

testCases = "AD 2H | H\nKD KH | C\nJH 10S | C"
run x = map (answer . parse) (lines x)