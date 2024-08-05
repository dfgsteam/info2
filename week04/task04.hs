import Data.Maybe

-- calculate roots of x ^2 + p x + q = 0
parabolaRootA :: Double -> Double -> ( Double , Double )
parabolaRootA p q
    | y < 0 = error " no roots "
    | otherwise = ( - x + sqrt y , -x - sqrt y )
    where
        x = p /2.0
        y = x * x - q

-- calculate roots of x ^2 + p x + q = 0
parabolaRootB :: Double -> Double -> Maybe ( Double , Double )
parabolaRootB p q
    | y < 0 = Nothing
    | otherwise = Just ( - x + sqrt y , -x - sqrt y )
    where
        x = p /2.0
        y = x * x - q

-- task01.01

-- s element -> 
match :: String -> [ String ] -> [ String ]
match _ [] = error "match no elements in list"
match a l =
    if head l == a then tail l
    else error "match no element found"

matchList :: [String] -> [String] -> [String]
matchList l [] = l
matchList [] l = error "matchList not items in list"
matchList (x:xs) (y:ys) = 
    --if x == y then matchList xs ys
    --else error "matchList no match"
    matchList (match y (x:xs)) ys

id_list_tail :: [ String ] -> [ String ]
id_list_tail [] = error "id_list_tail no elements in list"
id_list_tail (x:xs) = 
    if x == "," then 
        id_list_tail (matchList (x:xs) [",", "id"])
    else if x == ";" then
        matchList (x:xs) [";", "$$"]
    else 
        error "id_list_tail no element found"

id_list :: [ String ] -> [ String ]
id_list [] = error "id_list no elements in list"
id_list (x:xs) = 
    if x == "id" then
        id_list_tail (matchList (x:xs) ["id"])
    else 
        error "id_list_tail no element found"

-- task01.02





main :: IO ()
main = do
    print $ id_list ["id", ",", "id", ";", "$$"]
    print $ id_list_tail ["id", "$$"]

