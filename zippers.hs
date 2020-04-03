data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

freeTree :: Tree Char  
freeTree =   
    Node 'P'  
        (Node 'O'  
            (Node 'L'  
                (Node 'N' Empty Empty)  
                (Node 'T' Empty Empty)  
            )  
            (Node 'Y'  
                (Node 'S' Empty Empty)  
                (Node 'A' Empty Empty)  
            )  
        )  
        (Node 'L'  
            (Node 'W'  
                (Node 'C' Empty Empty)  
                (Node 'R' Empty Empty)  
            )  
            (Node 'A'  
                (Node 'A' Empty Empty)  
                (Node 'C' Empty Empty)  
            )  
        )  

--NOTE: Example of a poor implementation for changing a specific node of the tree
--changeToP :: Tree Char -> Tree Char  
--changeToP (Node x l (Node y (Node _ m n) r)) = Node x l (Node y (Node 'P' m n) r)  

--NOTE: Better, but still inneficient for navigating the tree
--data Direction = L | R deriving (Show)
--type Directions = [Direction]
--
--changeToP :: Directions -> Tree Char -> Tree Char
--changeToP (L:ds) (Node x l r) = (Node x (changeToP ds l) r)
--changeToP (R:ds) (Node x l r) = (Node x l (changeToP ds r))
--changeToP [] (Node _ l r) = (Node 'P' l r)
--
--elemAt :: Directions -> Tree a -> Either String a
--elemAt (L:ds) (Node x l r) = elemAt ds l
--elemAt (R:ds) (Node x l r) = elemAt ds r
--elemAt _ Empty = Left "Directions invalid, ran into empty tree"
--elemAt [] (Node x _ _) = Right x
--
--wDirections :: Directions
--wDirections = [R,L]

--NOTE: Implemented breadcrumbs to leave a trail back up the tree
--but they don't contain enough data to effectively navigate backwards
--type Breadcrumbs = [Direction]
--
--goLeft :: (Tree a, Breadcrumbs) -> (Tree a, Breadcrumbs)
--goLeft (Node _ l _, bs) = (l, L:bs)
--
--goRight :: (Tree a, Breadcrumbs) -> (Tree a, Breadcrumbs)
--goRight (Node _ _ r, bs) = (r, R:bs)

data Crumb a = LeftCrumb a (Tree a) | RightCrumb a (Tree a) deriving (Show)
type Breadcrumbs a = [Crumb a]
type Zipper a = (Tree a, Breadcrumbs a)

goLeft :: Zipper a -> Maybe (Zipper a)
goLeft (Node x l r, bs) = Just (l, LeftCrumb x r:bs)
goLeft (Empty, _) = Nothing

goRight :: Zipper a -> Maybe (Zipper a)
goRight (Node x l r, bs) = Just (r, RightCrumb x l:bs)
goRight (Empty, _) = Nothing

goUp :: Zipper a -> Maybe (Zipper a)
goUp (t, LeftCrumb x r:bs) = Just (Node x t r, bs)
goUp (t, RightCrumb x l:bs) = Just (Node x l t, bs)
goUp (_, []) = Nothing

modify :: (a -> a) -> Zipper a -> Zipper a
modify f (Node x l r, bs) = (Node (f x) l r, bs)
modify f (Empty, bs) = (Empty, bs)

attach :: Tree a -> Zipper a -> Zipper a
attach t (_, bs) = (t, bs)

--topMost :: Zipper a -> Zipper a
--topMost (t, []) = (t, [])
--topMost z = topMost $ goUp z

changeToP :: Zipper a -> Maybe (Zipper a)
changeToP t = return t >>= goRight >>= goLeft >>= goUp

type ListZipper a = ([a], [a])

goForward :: ListZipper a -> ListZipper a
goForward (x:xs, bs) = (xs, x:bs)

goBack :: ListZipper a -> ListZipper a
goBack (xs, b:bs) = (b:xs, bs)
