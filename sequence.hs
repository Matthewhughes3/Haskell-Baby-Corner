import Control.Monad

--main = do
--    rs <- sequence [getLine, getLine, getLine]
--    print rs

--main = do
--    sequence (map print [1..10])

main = do
    mapM print [1..10]