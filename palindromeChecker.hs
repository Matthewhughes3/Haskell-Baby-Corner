import System.Environment
import System.IO

--main = do
--    args <- getArgs
--    withFile (args !! 0) ReadMode (\handle -> do
--        contents <- hGetContents handle
--        putStr $ palindromeChecker contents)

main = do
    args <- getArgs
    contents <- readFile (args !! 0)
    putStr $ palindromeChecker contents

palindromeChecker :: String -> String
palindromeChecker = unlines . map (\line -> if reverse line == line then "palindrome" else "not a palindrome") . lines