length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (head1:tail1) (head2:tail2) = (head1, head2):zip' tail1 tail2

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n (head:tail) = head:take' (n-1) tail

-- NOTE: Remember the ++ operator is not like push even though it does the same thing! It needs two lists.
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (head:tail) = reverse' tail ++ [head]

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' e (head:tail)
    | e == head = True
    | otherwise = elem' e tail

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (head:tail) =
    let smallerSorted = quicksort [a | a <- tail, a <= head]
        biggerSorted = quicksort [a | a <- tail, a > head]
    in smallerSorted ++ [head] ++ biggerSorted

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (head1:tail1) (head2: tail2) = f head1 head2:zipWith' f tail1 tail2

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x