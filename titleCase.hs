map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x:map' f xs

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

lookup' :: (Eq k) => k -> [(k,v)] -> Maybe v
lookup' _ [] = Nothing
lookup' c ((k,v):xs)
  | c == k = Just v
  | otherwise = lookup' c xs

type Dict = [(Char,Char)]

toUpperDict :: Dict
toUpperDict = zip' ['a'..'z'] ['A'..'Z']

toLowerDict :: Dict
toLowerDict = zip' ['A'..'Z'] ['a'..'z']

changeCase :: Dict -> Char -> Char
changeCase dict c = 
  case lookup' c dict of
    Nothing -> c
    (Just newC) -> newC

toUpper :: Char -> Char
toUpper = changeCase toUpperDict

toLower :: Char -> Char
toLower = changeCase toLowerDict

titleCase :: String -> String
titleCase (x:xs) = toUpper x:map' toLower xs
