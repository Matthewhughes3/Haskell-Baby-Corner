collatz :: (Integral a) => a -> [a]
collatz 1 = [1]
collatz x
    | odd x = x:collatz (x * 3 + 1)
    | even x = x:collatz (x `div` 2)

chainsGreaterThanFifteen :: Int
chainsGreaterThanFifteen = length $ filter (>15) [length $ collatz x | x <- [1..100]]