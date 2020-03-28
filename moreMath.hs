-- Chad implementation
data Vector = Vector Float Float

instance Num Vector where
    (+) (Vector x1 y1) (Vector x2 y2) = Vector (x1 + x2) (y1 + y2)
    (*) (Vector x1 y1) (Vector x2 y2) = Vector (x1 * x2) (y1 * y2)
    (-) (Vector x1 y1) (Vector x2 y2) = Vector (x1 - x2) (y1 - y2)
    abs (Vector x y) = Vector (abs x) (abs y)
    signum (Vector x y) = Vector (signum x) (signum y)

instance Show Vector where
    show (Vector x y) = show (x, y)

-- Virgin implementation
--type Vector = (Float, Float)
--
--vAdd :: Vector -> Vector -> Vector
--vAdd (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)