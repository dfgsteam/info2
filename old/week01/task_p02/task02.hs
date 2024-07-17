import Data.Char (toLower)

containsList :: [ Int ] -> Int -> Bool -- Überprüft, ob eine Zahl im Array vorkommt
containsList (x:xs) y | x == y = True 
                      | otherwise = containsList xs y
containsList [] _ = False
                    
                    
countList :: [ Char ] -> Char -> Int -- Überprüft ob und wie oft ein Buchstabe im Array vorkommt
countList [] _ = 0
countList (x:xs) y | toLower x == y = 1 + countList (xs) y 
                   | otherwise = 0 + countList (xs) y 
