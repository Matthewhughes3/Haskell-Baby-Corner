import System.Environment

main = do
  (number:_) <- getArgs
  putStrLn $ show $ getCombinations $ read number

getCombinations :: Int -> [[Int]]
getCombinations x = sequenceA $ take x $ repeat [1..x]
