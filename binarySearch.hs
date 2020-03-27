data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

--TODO: Figure out how to get Tree to show like a list
--instance Show (Tree a) where
--	show EmptyTree = "[]"
--	show tree = show treeToList tree

testTree = Node 10 (Node 5 (Node 3 EmptyTree EmptyTree) EmptyTree) (Node 15 (Node 13 EmptyTree EmptyTree) EmptyTree)

singletonTree :: (Eq a) => a -> Tree a
singletonTree x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singletonTree x
treeInsert x (Node head left right)
  | x == head = Node x left right
  | x < head = Node head (treeInsert x left) right
  | x > head = Node head left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem _ EmptyTree = False
treeElem x (Node head left right)
  | x == head = True
  | x < head = treeElem x left
  | x > head = treeElem x right

listToTree :: (Ord a) => [a] -> Tree a
listToTree = foldl (flip treeInsert) EmptyTree

treeToList :: (Ord a) => Tree a -> [a]
treeToList EmptyTree = []
treeToList (Node head left right) = treeToList left ++ [head] ++ treeToList right
