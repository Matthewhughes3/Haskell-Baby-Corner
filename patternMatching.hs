lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky n = "Not so lucky"

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

topHeavy :: [Int] -> String
-- NOTE: the parens aren't for a tuple, they combined with the colon set top to the head of the input list and bottom to the tail
topHeavy (top:bottom) = if top > sum bottom then "You're top heavy!" else "You're not top heavy."