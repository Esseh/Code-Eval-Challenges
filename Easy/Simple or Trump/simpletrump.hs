import System.Environment (getArgs)

data Card = Joker | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace | TwoTrump | ThreeTrump | FourTrump | FiveTrump | SixTrump | SevenTrump | EightTrump | NineTrump | TenTrump | JackTrump | QueenTrump | KingTrump | AceTrump
	deriving (Enum,Eq,Ord,Show,Read)

	
dealCard :: String -> Char -> Card
dealCard card trump
	| init card == "2" && last card == trump = TwoTrump
	| init card == "3" && last card == trump = ThreeTrump
	| init card == "4" && last card == trump = FourTrump
	| init card == "5" && last card == trump = FiveTrump
	| init card == "6" && last card == trump = SixTrump
	| init card == "7" && last card == trump = SevenTrump
	| init card == "8" && last card == trump = EightTrump
	| init card == "9" && last card == trump = NineTrump
	| init card == "10" && last card == trump = TenTrump
	| init card == "J" && last card == trump = JackTrump
	| init card == "Q" && last card == trump = QueenTrump
	| init card == "K" && last card == trump = KingTrump
	| init card == "A" && last card == trump = AceTrump
	| init card == "2" = Two
	| init card == "3" = Three
	| init card == "4" = Four
	| init card == "5" = Five
	| init card == "6" = Six
	| init card == "7" = Seven
	| init card == "8" = Eight
	| init card == "9" = Nine
	| init card == "10" = Ten
	| init card == "J" = Jack
	| init card == "Q" = Queen
	| init card == "K" = King
	| init card == "A" = Ace
	| otherwise = Joker
	
answer :: [String] -> String
answer x = trumpDeuce (x!!0) (x!!1) (x!!3)

trumpDeuce :: String -> String -> String -> String
trumpDeuce handA handB trump = determineWinner (dealCard handA (head trump)) (dealCard handB (head trump))
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