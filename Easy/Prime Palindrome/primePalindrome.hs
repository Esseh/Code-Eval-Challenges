isPalindrome  :: (Eq a, Show a) => a -> Bool
isPalindrome x = v == reverse v
	where v = show x

isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

isPrime :: Int -> Bool
isPrime 1 = False
isPrime k = null [ x | x <- [2..isqrt k], k `mod`x  == 0]

r = head [show v | v <- [999,998..], isPalindrome v, isPrime v]

main = do
	putStrLn $  r