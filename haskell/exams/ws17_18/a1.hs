sumDQ :: [Float] -> Float
sumDQ l = sumDQlength l (length l)
  where
    sumDQlength [x] 1 = x
    sumDQlength l n
        | even n =
            sumDQlength (take halfL l) halfL
                + sumDQlength (drop halfL l) halfL
        | otherwise =
            sumDQlength (take (halfL + 1) l) (halfL + 1)
                + sumDQlength (drop (halfL + 1) l) halfL
      where
        halfL = div n 2

main :: IO ()
main = do
    print (sumDQ [1 .. 100000])
