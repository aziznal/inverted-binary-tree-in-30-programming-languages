import Control.Monad (mapM)

data Node = Node
  {
    content :: String,
    left :: Maybe Node,
    right :: Maybe Node
  }
  deriving (Show)

getTraversal :: Node -> [String]
getTraversal node = 
  let 
      currentNodeContent = [content node]
    
      leftResult = case left node of
                     Nothing -> []
                     Just leftNode -> getTraversal(leftNode)

      rightResult = case right node of
                     Nothing -> []
                     Just rightNode -> getTraversal(rightNode)
  in 
    leftResult ++ currentNodeContent ++ rightResult

reverseTree :: Node -> Node
reverseTree node = 
  let 
      currentNodeContent = content node
      
      reversedLeft = case left node of
                       Nothing -> Nothing
                       Just leftNode -> Just (reverseTree leftNode) 

      reversedRight = case right node of
                       Nothing -> Nothing
                       Just rightNode -> Just (reverseTree(rightNode)) 
  in
    Node { content = currentNodeContent, left = reversedRight, right = reversedLeft }

showTraversal :: [String] -> IO ()
showTraversal [] = putStrLn "[]"
showTraversal xs = do
   mapM_ (\x -> putStr (x ++ ", ")) xs 
   putStrLn ""

main :: IO ()
main = do
  let leaf1 = Node { content = "1", left = Nothing, right = Nothing }
      leaf2 = Node { content = "3", left = Nothing, right = Nothing }
      leaf3 = Node { content = "5", left = Nothing, right = Nothing }

      node2 = Node { content = "2", left = Just leaf1, right = Just leaf2 }
      node1 = Node { content = "4", left = Just node2, right = Just leaf3 }

  showTraversal (getTraversal(node1))

  showTraversal (getTraversal (reverseTree node1))

