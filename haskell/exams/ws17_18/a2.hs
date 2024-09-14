data Rope
    = Leaf String
    | Inner Rope Int Rope

instance Show Rope where
    show (Leaf s) = "Leaf " ++ show s
    show (Inner left n right) =
        "Inner (" ++ show left ++ ") " ++ show n ++ " (" ++ show right ++ ")"

exampleRope = Inner (Leaf "Hello") 5 (Inner (Leaf ", w") 3 (Leaf "orld!"))

ropeLength :: Rope -> Int
ropeLength (Leaf s) = length s
ropeLength (Inner r w l) = w + ropeLength l

ropeConcat :: Rope -> Rope -> Rope
ropeConcat r1 = Inner r1 (ropeLength r1)

ropeSplitAt :: Int -> Rope -> (Rope, Rope)
ropeSplitAt i r = ropeSplitAtAcc i r (Leaf "") (Leaf "")
  where
    ropeSplitAtAcc i (Leaf s) accL accR =
        (ropeConcat accL (Leaf (take i s)), ropeConcat (Leaf (drop i s)) accR)
    ropeSplitAtAcc i (Inner l w r) accL accR
        | i < w = ropeSplitAtAcc i l accL (ropeConcat r accR)
        | otherwise = ropeSplitAtAcc (i - w) r (ropeConcat accL l) accR

main = do
    print exampleRope
    print (ropeLength exampleRope)
    -- print (ropeConcat exampleRope exampleRope)
    -- print (ropeSplitAt 5 exampleRope)
    print (ropeSplitAt 7 exampleRope)
