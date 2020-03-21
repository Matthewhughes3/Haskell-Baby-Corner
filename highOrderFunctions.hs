map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (head:tail) = f head:map' f tail

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (head:tail)
    | f head = head:filter' f tail
    | otherwise = filter' f tail

length' :: [a] -> Int
length' [] = 0
length' (_:tail) = 1 + length' tail

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (head:tail) = 
    let smallerSorted = quicksort' (filter' (<= head) tail)
        largerSorted = quicksort' (filter' (> head) tail)
        in smallerSorted ++ [head] ++ largerSorted

largestDivisible :: (Integral a) => a -> a
largestDivisible n = head (filter' divisible [100000,99999..])
    where divisible x = x `mod` n == 0

takeWhile' :: (Eq a) => (a -> Bool) -> [a] -> [a]
takeWhile' f (head:tail)
    | f head = head:takeWhile' f tail
    | otherwise = []

findIndex' :: (Eq a) => (a -> Bool) -> [a] -> Int
findIndex' f (head:tail)
    | f head = 0
    | otherwise = 1 + findIndex' f tail

bigSum :: (Integral a) => a
bigSum = sum (takeWhile' (<10000) [x^2 | x <- oddNumbers])
    where oddNumbers = [1,3..]