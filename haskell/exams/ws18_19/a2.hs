data Queue a = Queue [a] [a]
data Tree t
    = Leaf
    | Node (Tree t) t (Tree t)

fromList :: [a] -> Queue a
fromList xs = Queue xs []

toList :: Queue a -> [a]
toList (Queue xs ys) = xs ++ reverse ys

enqueue :: a -> Queue a -> Queue a
enqueue x (Queue xs ys) = Queue xs (x : ys)

dequeue :: Queue a -> Maybe (a, Queue a)
dequeue (Queue [] []) = Nothing
dequeue (Queue [] ys) = dequeue (Queue (reverse ys) [])
dequeue (Queue (x : xs) ys) = Just (x, Queue xs ys)

bfs :: Tree a -> [a]
bfs t = go (fromList [t])
  where
    go q = go2 (dequeue q)
    go2 Nothing = []
    go2 (Just (Leaf, q')) = go q'
    go2 (Just (Node l x r, q')) = x : go (enqueue r (enqueue l q'))

main :: IO ()
main = print $ bfs (Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf))
