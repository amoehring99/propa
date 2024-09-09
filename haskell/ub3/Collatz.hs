collatz :: Int -> [Int]
collatz a = iterate (\x -> if even x then x `div` 2 else 3 * x + 1) a

num :: Int -> Int
num a = length (takeWhile (/= 1) (collatz a))

maxNum :: Int -> Int -> (Int, Int)
maxNum a b = foldl maxPair (0, 0) (map (\m -> (m, num m)) [a .. b])
  where
    maxPair (m, n) (m', n')
        | n > n' = (m, n)
        | otherwise = (m', n')

main :: IO ()
main = do
    print (num 4)
    print $ take 10 (collatz 4)
    print (maxNum 1 1000)
