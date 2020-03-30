import System.Environment

main = do
  (number:_) <- getArgs
  let combinations = getCombinations $ read number
  putStrLn $ show combinations
  putStrLn $ (show $ length combinations) ++ " combinations!"

getCombinations :: Int -> [[Int]]
getCombinations x = sequenceA $ take x $ repeat [1..x]
