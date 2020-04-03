module Writer (Writer, tell, runWriter) where

newtype Writer w a = Writer { runWriter :: (a,w) }

instance Functor (Writer w) where
  fmap f (Writer (x,v)) = Writer (f x,v)

instance (Monoid w) => Applicative (Writer w) where
  pure x = Writer (x, mempty)
  Writer (f,v) <*> Writer (x,v') = Writer (f x, v `mappend` v')

instance (Monoid w) => Monad (Writer w) where  
  return x = Writer (x, mempty)  
  (Writer (x,v)) >>= f = let (Writer (y, v')) = f x in Writer (y, v `mappend` v')  

logNumber :: Int -> Writer [String] Int  
logNumber x = Writer (x, ["Got number: " ++ show x])

tell :: (Monoid a) => a -> Writer a ()
tell v = Writer ((), v)
  
multWithLog :: Writer [String] Int  
multWithLog = do  
  a <- logNumber 3  
  b <- logNumber 5  
  tell ["Multiplying 3 and 5"]
  return (a*b) 

gcd' :: Int -> Int -> Writer [String] Int
gcd' a b
  | b == 0 =    do
      tell ["Finished with a " ++ show a]
      return a
  | otherwise = do
      tell [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)]
      gcd' b (a `mod` b)
