getRightTriangleRange :: Int -> Int -> [(Int, Int, Int)]
getRightTriangleRange rangeStart rangeEnd
    | rangeStart >= rangeEnd = []
    | otherwise = [(a, b, c) | c <- [rangeStart..rangeEnd], b <- [rangeStart..c], a <- [rangeStart..b], a^2 + b^2 == c^2]