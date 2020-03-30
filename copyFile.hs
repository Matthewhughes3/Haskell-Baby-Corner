import System.Environment  
import System.IO
import System.IO.Error
import Control.Exception
import qualified System.Directory as D
import qualified Data.ByteString.Lazy as B  
  
--main = do  
--    (fileName1:fileName2:_) <- getArgs  
--    fileExists <- D.doesFileExist fileName1
--    if fileExists
--       then do copyFile fileName1 fileName2
--       else do putStrLn $ fileName1 ++ " does not exist!"

main = toTry `catch` handler

toTry :: IO ()
toTry = do
  (fileName1:fileName2:_) <- getArgs
  copyFile fileName1 fileName2

handler :: IOError -> IO ()
handler e
  | isDoesNotExistError e = 
    case ioeGetFileName e of
      Just path -> putStrLn $ path ++ " does not exist"
      Nothing -> putStrLn "File does not exist"
  | otherwise = ioError e
  
copyFile :: FilePath -> FilePath -> IO ()  
copyFile source dest = do  
    contents <- B.readFile source  
    B.writeFile dest contents  
