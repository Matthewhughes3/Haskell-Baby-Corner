import qualified Data.List as List
import Control.Monad

test = "10 4 3 + 2 * -"

solveRPN :: (Num a, Read a) => String -> Maybe a
solveRPN st = do
  [result] <- foldM foldingFunction [] (words st)
  return result

foldingFunction :: (Num a, Read a) => [a] -> String -> Maybe [a]
foldingFunction (x:y:ys) "*" = return ((x * y):ys)
foldingFunction (x:y:ys) "+" = return ((x + y):ys)
foldingFunction (x:y:ys) "-" = return ((y - x):ys)
foldingFunction xs numberString = liftM (:xs) (readMaybe numberString)

readMaybe :: (Read a) => String -> Maybe a
readMaybe st = 
  case reads st of 
    [(x,"")] -> Just x
    _ -> Nothing
