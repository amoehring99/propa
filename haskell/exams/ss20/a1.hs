import Data.List

indexOf s l = indexOfAcc s l 0
  where
    indexOfAcc s [] acc = error ("String '" ++ s ++ "' not an element of the list")
    indexOfAcc s (l : ls) acc
        | s == l = acc
        | otherwise = indexOfAcc s ls (acc + 1)

shiftR :: [a] -> [a]
shiftR a = (last a) : (take (length a - 1) a)

rotations :: [a] -> [[a]]
rotations a = take (length a) (iterate shiftR a)

transform :: String -> (Int, String)
transform s = (indexOf s (rotations s), map last (sort (rotations s)))

main = do
    print (indexOf "b" ["a", "b", "c"]) -- Expected: 1
    print (rotations [1, 2, 3, 4]) -- Expected: [[4,1,2,3], [3,4,1,2], [2,3,4,1], [1,2,3,4]]
    print (transform "ananas") -- Expected: (0, "snnaaa")
