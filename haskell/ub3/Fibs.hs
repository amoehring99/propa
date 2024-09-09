fibs = 0 : 1 : zipWith (+) fibs (drop 1 fibs)

main = print $ take 10 fibs
