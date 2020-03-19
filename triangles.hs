--TODO: make sure rangeStart is greater than rangeEnd
getRightTriangleRange :: Int -> Int -> [(Int, Int, Int)]
getRightTriangleRange rangeStart rangeEnd = [(a, b, c) | c <- [rangeStart..rangeEnd], b <- [rangeStart..c], a <- [rangeStart..b], a^2 + b^2 == c^2]