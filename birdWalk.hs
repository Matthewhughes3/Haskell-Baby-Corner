type Bird = Int
type Pole = (Bird,Bird)

landLeft :: Bird -> Pole -> Either String Pole
landLeft x (l,r) 
  | x + l > r + 3 = Left "Man fall down"
  | otherwise = Right (l + x, r)

landRight :: Bird -> Pole -> Either String Pole
landRight x (l,r)
  | x + r > l + 3 = Left "Man fall down"
  | otherwise = Right (l, r + x)

--TODO: figure out how to get this to merge the results from a and b
routine :: Pole -> Either String Pole
routine = do
  a <- landLeft 3
  b <- landRight 3
  return (a)
