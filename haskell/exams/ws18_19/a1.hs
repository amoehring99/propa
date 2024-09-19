substr :: (Eq a) => [a] -> [a] -> Bool
substr [] _ = True
substr _ [] = False
substr xs ys = take (length xs) ys == xs || substr xs (drop 1 ys)

main = do
    print (substr "ung" "Vorlesungsfolien")
    print (substr "ug" "Vorlesungsfolien")
