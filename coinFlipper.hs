import System.Random
import System.IO
import System.Environment

main = do
    gen <- getStdGen
    (flipCount:_) <- getArgs
    let flips = coinFlips gen (read flipCount)
    putStrLn $ show flips
    let headCount = length $ filter (==True) flips
    putStrLn $ "Heads: " ++ show headCount
    putStrLn $ "Tails: " ++ (show $ length flips - headCount)

coinFlips :: (RandomGen a) => a -> Int -> [Bool]
coinFlips gen flipCount = take flipCount $ randoms gen
