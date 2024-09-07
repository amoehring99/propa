pow1 b e
    | e == 0 = 1
    | otherwise = b * pow1 b (e - 1)

pow2 b e
    | e == 0 = 1
    | even e = pow2 (b * b) (div e 2)
    | otherwise = b * pow2 (b * b) (div e 2)

pow3Acc b e acc
    | e == 0 = acc
    | even e = pow3Acc (b * b) (div e 2) acc
    | otherwise = pow3Acc (b * b) (div e 2) (b * acc)

pow3 b e
    | e < 0 = error "negative exponent"
    | otherwise = pow3Acc b e 1

main = do
    print (pow1 2 10)
    print (pow2 2 10)
    print (pow3 2 10)
