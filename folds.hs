-- Reference recursion def
--sum' :: (Num a) => [a] -> a
--sum' [] = 0
--sum' (head:tail) = head + sum' tail

--sum' :: (Num a) => [a] -> a
--sum' list = foldl (\acc head -> acc + head) 0 list

sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0

-- TODO: figure out how folds really work
--foldl' :: ([a] -> a -> [a]) -> [a] -> [a] -> [a]
--foldl' _ _ [] = []
--foldl' f acc (head:tail) = f acc head:foldl' 
-- what's a matter pea brain? Can't fold?

reverse' :: [a] -> [a]
reverse' = foldl (\acc head -> head:acc) []

map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\tail acc -> f tail:acc) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\tail acc -> if f tail then tail:acc else acc) []