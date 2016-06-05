import System.Environment (getArgs)

answerHex  :: [String] -> Int
answerHex x = sum (map (\b -> read b::Int) (map (\v -> "0x"++v) x ))

answerBin :: [String] -> Int
answerBin x = sum . map (binToDec) $ x

binToDec :: String -> Int
binToDec x = bTDHelper 0 0 (map (\v -> if v=='0' then 0 else 1) (reverse x))
	where bTDHelper total scaler binList = if binList == [] then total else bTDHelper (total+(head binList)*2^scaler) (scaler+1) (tail binList)

answer :: ([String],[String]) -> String
answer x = show $ (answerBin $ (tail (snd x))) >= (answerHex $ (fst x)) 

parse :: String -> ([String],[String])
parse x = splitAt ((find "|" (words x))) (words x) 

find :: String -> [String] -> Int
find x xs = helper 0 x xs 
	where helper pos b bs
		| bs == [] = -1
		| b == head bs = pos
		| otherwise = helper (pos+1) b (tail bs)

main = do
	[inpFile] <- getArgs
	input <- readFile inpFile
	mapM_ putStrLn $  map (answer . parse) (lines input)
