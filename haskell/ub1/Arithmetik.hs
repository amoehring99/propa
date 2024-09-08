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

root e r
    | e <= 0 = error "non positive exponent"
    | r < 0 = error "negative base"
    | e == 1 = r
    | otherwise = interval 0 r
  where
    interval a b
        | b - a == 1 = a
        | pow3 half e > r = interval a half
        | pow3 half e < r = interval half b
        | otherwise = half
      where
        half = div (b + a) 2

isPrime n = isPrimeAcc 2 n
  where
    isPrimeAcc acc n
        | mod n acc == 0 = False
        | acc >= root 2 n = True
        | otherwise = isPrimeAcc (acc + 1) n

main = do
    print (pow1 2 10)
    print (pow2 2 10)
    print (pow3 2 10)
    print (root 10 1026)
    print (isPrime 31)
