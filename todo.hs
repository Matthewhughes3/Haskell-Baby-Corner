import System.Environment
import System.Directory
import System.IO
import Data.List

dispatch :: [(String, [String] -> IO ())]
dispatch = [
    ("add", add),
    ("view", view),
    ("bump", bump),
    ("remove", remove)]

main = do 
    (command:args) <- getArgs
    case lookup command dispatch of
        Nothing -> putStrLn "Invalid Command"
        (Just action) -> action args

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

--TODO: figure out a good way to share functionality between this and remove
bump :: [String] -> IO()
bump [fileName, numberString] = do
    handle <- openFile fileName ReadMode  
    (tempName, tempHandle) <- openTempFile "." "temp"  
    contents <- hGetContents handle  
    let number = read numberString  
        todoTasks = lines contents  
        moveTask = todoTasks !! (number - 1)
        newTodoItems = moveTask:delete moveTask todoTasks  
    hPutStr tempHandle $ unlines newTodoItems  
    hClose handle  
    hClose tempHandle  
    removeFile fileName  
    renameFile tempName fileName 

view :: [String] -> IO ()
view [fileName] = do 
    contents <- readFile fileName
    putStr $ unlines $ zipWith (\line n -> show n ++ " - " ++ line) (lines contents) [1..]

remove :: [String] -> IO ()  
remove [fileName, numberString] = do  
    handle <- openFile fileName ReadMode  
    (tempName, tempHandle) <- openTempFile "." "temp"  
    contents <- hGetContents handle  
    let number = read numberString  
        todoTasks = lines contents  
        newTodoItems = delete (todoTasks !! (number - 1)) todoTasks  
    hPutStr tempHandle $ unlines newTodoItems  
    hClose handle  
    hClose tempHandle  
    removeFile fileName  
    renameFile tempName fileName 