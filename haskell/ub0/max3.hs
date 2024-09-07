max3v1 x y z = max x (max y z)

max3v2 x y z =
    if x >= y && x >= z
        then x
        else
            if y >= z
                then y
                else z

max3v3 x y z
    | x >= y && x >= z = x
    | y >= z = y
    | otherwise = z

main = do
    print (max3v1 1 2 3)
    print (max3v2 1 2 3)
    print (max3v3 1 2 3)
