properDivisors :: Integer -> [Integer]
properDivisors x = [l | l <- [1 .. div x 2], mod x l == 0]

perfectNumber :: Integer -> Bool
perfectNumber x
    | sum (properDivisors x) == x = True
    | otherwise = False

properDivisors2 :: Integer -> [Integer]
properDivisors2 x = 1 : [l | l <- [2 .. floor (sqrt (fromIntegral x))], mod x l == 0]

properDivisors3 :: Integer -> [Integer]
properDivisors3 n = [l | l <- div divisors 2, mod n divisors == 0] : divisors
    where divisors = [l | l <-]

main :: IO ()
main = do
    print (properDivisors2 28)
    print (properDivisors 28)
    print (perfectNumber 28)
    print (perfectNumber 27)
