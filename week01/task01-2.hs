import Data.Char (toLower)

-- task01-01
quadratic :: (Int , Int , Int ) -> Int -> Int
quadratic (a, b, c) x = a*x^2 + b*x + c

sumTupel :: (Int , Int ) -> Int
sumTupel (a, b) = a

-- task01-02
square :: Int -> Int
square n = if n < 0 then square(-n)
            else if n == 0 then 0
            else 2 * n - 1 + square(n-1)

-- task01-03-01
sumList :: [ Int ] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList(xs)

-- task01-03-02
foldList :: ( Double -> Double -> Double ) -> [ Double ] -> Double
foldList _ [] = 0
foldList _ [x] = x
foldList o (x:xs) = x `o` (foldList o xs)

-- task01-03-03
mapList :: ( Int -> Int ) -> [ Int ] -> [ Int ]
mapList _ [] = []
mapList f (x:xs) = f x : mapList f xs

-- task01-04
tableInt :: ( Int -> Int ) -> [ Int ] -> String
tableInt _ [] = ""
tableInt f (x:xs) =  show x ++ ":" ++ show (f x) ++ "\n" ++ tableInt f xs

-- task02-01
containsList :: [ Int ] -> Int -> Bool
containsList [] _ = False
containsList (x:xs) a = if a == x then True
                        else containsList xs a

-- task02-02
countList :: [ Char ] -> Char -> Int
countList [] _ = 0
countList (x:xs) c = if toLower(x) == toLower(c) then 1 + countList xs c
                    else countList xs c

