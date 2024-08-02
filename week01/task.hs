quadratic :: (Int , Int , Int ) -> Int -> Int
quadratic (a,b,c) x = a*x^2+b*x+c

square :: Int -> Int
square x =
    if x < 0 then square((-1)*x)
    else if x == 0 then 0
    else 2*x - 1 + square (x-1)

sumList :: [Int] -> Int
sumList []     = 0
sumList (x:xs) = x + sumList xs

foldList :: ( Double -> Double -> Double ) -> [ Double ] -> Double
foldList _ [x] = x
foldList (a) (x:xs) = (a) x (foldList (a) xs) 

mapList :: ( Int -> Int ) -> [ Int ] -> [ Int ]
mapList a [] = []
mapList a (x:xs) = a x : mapList a xs 