import System.Environment
import DiffList
import Writer

dispatch :: [(String, [String])]
dispatch = [("slow", (runSlow)),
           ("fast", (runFast))]

main = do
  (command:_) <- getArgs
  case lookup command dispatch of
    Nothing -> putStrLn "Invalid Command"
    (Just xs) -> mapM_ putStrLn $ xs

testAmount :: Int
testAmount = 50000

runFast :: [String]
runFast = fromDiffList . snd . runWriter $ fastFinalCountDown testAmount
--
runSlow :: [String]
runSlow = snd . runWriter $ finalCountDown testAmount

finalCountDown :: Int -> Writer [String] ()  
finalCountDown 0 = do  
    tell ["0"]  
finalCountDown x = do  
    finalCountDown (x-1)  
    tell [show x]  

-- NOTE: since difflists are right associative with ++, they're a bajillion times faster
-- to append to than traditional lists
fastFinalCountDown :: Int -> Writer (DiffList String) ()
fastFinalCountDown 0 = do
  tell (toDiffList ["0"])
fastFinalCountDown x = do
  fastFinalCountDown (x-1)
  tell (toDiffList [show x])
