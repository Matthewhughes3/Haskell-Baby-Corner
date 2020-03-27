getKey :: (Eq k) => k -> [(k, v)] -> Maybe v
getKey _ [] = Nothing
getKey key ((k, v):tail) = if key == k 
    then Just v
    else getKey key tail

getKey' :: (Eq k) => k -> [(k, v)] -> Maybe v
getKey' key = foldl (\acc (k, v) -> if k == key then Just v else acc) Nothing