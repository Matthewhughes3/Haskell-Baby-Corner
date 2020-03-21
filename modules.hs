import Data.List

uniqueCount :: (Eq a) => [a] -> Int
uniqueCount = length . nub

expGrowth :: Int -> Int -> [Int]
expGrowth base limit = take limit $ iterate (*2) base