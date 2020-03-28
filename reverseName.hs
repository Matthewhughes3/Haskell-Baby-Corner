--main = do   
--    line <- getLine  
--    if null line  
--        then return ()  
--        else do  
--            putStrLn $ reverseWords line  
--            main  

import Control.Monad
main = do
    line <- getLine
    when (not $ null line) $ do
        putStrLn $ reverseWords line
        main
  
reverseWords :: String -> String  
reverseWords = unwords . map reverse . words  