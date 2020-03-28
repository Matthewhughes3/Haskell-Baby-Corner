-- WIP
import System.IO
import System.Environment
import Control.Monad

main = do
    args <- getArgs
    contents <- readFile (args !! 0)
    putStr (readTodos contents)
    putStrLn "What would you like to do?" 
    putStrLn "(a item) - add item"
    putStrLn "(d number) - delete item"
    putStrLn "Press Enter to exit"
    command <- getLine
    when (not $ null command) $ handleCommand

--handleCommand :: String -> IO String
handleCommand command = do 
    let commandArgs = words command
    if length commandArgs /= 2 || length (commandArgs !! 0) > 1
        then putStrLn "Bad Command"
        else putStrLn "Good" 
    handleCommand command

readTodos :: String -> String
readTodos todos = unlines $ zipWith (\line n -> show n ++ " - " ++ line) (lines todos) [1..]