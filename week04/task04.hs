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
removeLast :: String -> String
removeLast [] = []
removeLast [_] = []
removeLast (x:xs) = x : removeLast xs

match2 :: Char -> Maybe String -> Maybe String
match2 _ Nothing = Nothing
match2 _ (Just []) = Nothing
match2 a (Just (x:xs)) =
    if x == a then Just xs
    else Nothing

prog :: String -> Maybe String
prog [] = Nothing
prog l = 
    if last l == '$' then
        case expr (Just (removeLast l)) of
            Just "" -> Just ""
            _ -> Nothing
    else Nothing

expr :: Maybe String -> Maybe String
expr l = case term l of
    Just rest -> ttail (Just rest)
    Nothing -> Nothing

term :: Maybe String -> Maybe String
term l = ftail (factor l)

ttail :: Maybe String -> Maybe String
ttail Nothing = Nothing
ttail (Just []) = Just []
ttail (Just l) = 
    let
        newString = match2 '+' (Just l)
    in
        case newString of
            Just rest -> ttail (term (Just rest))
            Nothing -> Just l

factor :: Maybe String -> Maybe String
factor Nothing = Nothing
factor (Just []) = Nothing
factor (Just (x:xs)) =
    if x == 'c' then Just xs
    else Nothing

ftail :: Maybe String -> Maybe String
ftail Nothing = Nothing
ftail (Just []) = Just []
ftail (Just l) = 
    let
        newString = match2 '*' (Just l)
    in
        case newString of
            Just rest -> ftail (factor (Just rest))
            Nothing -> Just l


main :: IO ()
main = do
    print $ id_list ["id", ",", "id", ";", "$$"]
    print $ prog "c+c*c$"
    print $ prog "c+c-c$"
    print $ prog "c$"         -- Expected: Just ""
    print $ prog "c+c$"       -- Expected: Just ""
    print $ prog "c*c$"       -- Expected: Just ""
    print $ prog "c*c+c$"     -- Expected: Just ""
    print $ prog "c+c"        -- Expected: Nothing
    print $ prog "+c$"        -- Expected: Nothing
    print $ prog "a$"         -- Expected: Nothing


