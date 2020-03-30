import qualified Data.List as List

-- NOTE: this is a virgin sorting algorithm. I'm just trying to implement it for fun
bubbleSortRound :: (Ord a) => [a] -> [a]
bubbleSortRound [] = []
bubbleSortRound (x:[]) = x:[]
bubbleSortRound (x:y:ys) = if x > y then y:bubbleSortRound (x:ys) else x:bubbleSortRound (y:ys)

bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort xs 
  | xs == sorted = xs 
  | otherwise = bubbleSort sorted
  where sorted = bubbleSortRound xs

--TODO: figure out how to implement merge sort
--bisectList :: [a] -> ([a], [a])
--bisectList xs = splitAt (length xs `div` 2) xs
--
--mergeSort :: (Ord a) => [a] -> [a]
--mergeSort [] = []
--mergeSort [x] = [x]
--mergeSort xs = concat $ zipWith (\x y -> if x > y then y:[x] else x:[y]) (mergeSort left) (mergeSort right)
--  where (left, right) = bisectList xs
