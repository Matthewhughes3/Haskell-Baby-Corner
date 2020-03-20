factorial n = product [1..n]

factorial2 :: (Integral a) => a -> a
factorial2 0 = 1
factorial2 n = n * factorial (n - 1)