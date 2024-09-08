insert x [] = [x]
insert x (y : ys)
    | x <= y = x : y : ys
    | otherwise = y : insert x ys

insertSort = foldr insert []

merge [] xs = xs
merge ys [] = ys
merge (y : ys) (x : xs)
    | y <= x = y : merge ys (x : xs)
    | otherwise = x : merge (y : ys) xs

mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort (take (div (length xs) 2) xs)) (mergeSort (drop (div (length xs) 2) xs))

main = do
    print (insert 4 [1, 2, 3])
    print (insertSort [3, 2, 1])
    print (merge [2, 4] [1, 2, 3])
    print (mergeSort [3, 2, 1])
