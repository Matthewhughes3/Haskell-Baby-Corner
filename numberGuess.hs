import System.Random  
import Control.Monad(when)  
  
main = do  
    gen <- getStdGen  
    askForNumber gen  
  
askForNumber :: StdGen -> IO ()  
askForNumber gen = do  
    let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen)  
    putStrLn "Which number in the range from 1 to 10 am I thinking of? "  
    numberString <- getLine  
    when (not $ null numberString) $ do  
        case reads numberString of
            [] -> putStrLn "Enter a real number, brainlet"
            [(number,_)] -> 
                if randNumber == number   
                    then putStrLn "You are correct!"  
                    else putStrLn $ "Sorry, it was " ++ show randNumber  
        askForNumber newGen  