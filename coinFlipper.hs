import System.Random
import System.IO
import System.Environment

main = do
    gen <- getStdGen
    (flipCount:_) <- getArgs
    putStrLn $ show $ coinFlips gen (read flipCount)

coinFlips :: (RandomGen a) => a -> Int -> [Bool]
coinFlips gen flipCount = take flipCount $ randoms gen