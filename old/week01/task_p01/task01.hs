-- Die Funktion quadratic berechnet das Ergebnis einer quadratischen Gleichung mit den gegebenen Koeffizienten a, b, c und einer Variablen x.
quadratic :: (Int , Int , Int ) -> Int -> Int
quadratic (a,b,c) x =  a * x *x + b *x +c

-- Die Funktion square berechnet das Quadrat einer Zahl n und gibt 0 zurück, wenn n 0 ist oder n negativ ist, wird der Aufruf rekursiv mit der positiven Zahl durchgeführt.
square :: Int -> Int
square n | n < 0 = square(-n) -- Falls n negativ ist, wird die Funktion mit der positiven Zahl aufgerufen
         | n == 0 = 0 -- Wenn n gleich 0 ist, wird 0 zurückgegeben
         | otherwise = n * n -- Wenn n positiv ist, wird das Quadrat von n berechnet

-- Die Funktion sumList berechnet die Summe einer gegebenen Liste von Integern
sumList :: [ Int ] -> Int
sumList [] = 0 -- Wenn die Liste leer ist, wird 0 zurückgegeben
sumList (x:xs) = x + sum xs -- Wenn die Liste nicht leer ist, wird das erste Element x genommen und mit der Summe des Rests der Liste rekursiv addiert

-- Die Funktion foldList nimmt eine Funktion f und eine Liste von Double-Werten und gibt das Ergebnis der Faltenoperation zurück
foldList :: ( Double -> Double -> Double ) -> [ Double ] -> Double
foldList op (x:xs)
    | length xs > 1 = op x (foldList op xs)
    | otherwise = op x (head xs)
-- foldList f [x] = x -- Wenn die Liste nur ein Element hat, wird das Element zurückgegeben
-- foldList f (x:xs) = f x (foldList f xs) -- Wenn die Liste mehr als ein Element hat, wird die Faltenoperation auf die Liste angewendet

-- Die Funktion mapList nimmt eine Funktion f und eine Liste von Integern und gibt eine neue Liste von Integern zurück, wobei jede Zahl in der ursprünglichen Liste mit der Funktion f verarbeitet wird
mapList :: ( Int -> Int ) -> [ Int ] -> [ Int ]
mapList f (x:xs) = f x : mapList f xs -- Die Funktion wird rekursiv aufgerufen und jedes Element in der ursprünglichen Liste wird mit f verarbeitet und in der neuen Liste gespeichert
--mapList f (x:[]) = f x : mapList f [] -- Alternative Implementierung für den Fall, dass nur ein Element in der Liste ist
mapList f [] = [] -- Wenn die Liste leer ist, wird eine leere Liste zurückgegeben

-- Die Funktion tableInt nimmt eine Funktion f und eine Liste von Integern und gibt eine formatierte String-Tabelle zurück, die aus der Anwendung der Funktion f auf jedes Element in der Liste resultiert
tableInt :: ( Int -> Int ) -> [ Int ] -> String
tableInt f [] = "" -- Wenn die Liste leer ist, wird ein leerer String zurückgegeben
tableInt f [x] = show x ++ ":" ++ show (f x) -- Wenn die Liste nur ein Element hat, wird das Element und das Ergebnis der Anwendung der Funktion f auf dieses Element zurückgegeben
tableInt f (x:xs) = show x ++":"++ show (f x) ++ "\n" ++ tableInt f xs -- Wenn die Liste mehr als ein Element hat, wird

