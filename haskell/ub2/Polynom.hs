type Polynom = [Double]

cmult :: Polynom -> Double -> Polynom
cmult p c = map (* c) p

eval :: Polynom -> Double -> Double
eval p x = sum (cmult p x)

deriv :: Polynom -> Polynom
deriv p = zipWith (*) [1 ..] (drop 1 p)

main = do
    print (cmult [] 2)
    print (cmult [1, 2, 3, 4] 2)
    print (eval [2, 1, 1] 2)
    print (deriv [1, 1, 1, 1, 1])
