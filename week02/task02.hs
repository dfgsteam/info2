import Data.Char (intToDigit)

type Nibble = (Bool, Bool, Bool, Bool)

-- task00
sumD :: Int -> [Int] -> Int
sumD n x =
    if n == 0 then 0
    else (x !! (n-1)) * 2 ^ (n-1) + sumD (n-1) x

calcZ :: Int -> [Int] -> Int
calcZ n x = -(x !! (n-1)) * 2 ^ (n-1) + sumD (n-1) x


--nBitAddierer :: [Bool] -> [Bool] -> [(Bool, Bool)]
--nBitAddierer [x:xs] [y:ys] = einBitAddierer x y 


-- task01.01
boolToInt :: Bool -> Int
boolToInt True = 1
boolToInt False = 0

nibbleToString :: Nibble -> String
nibbleToString (a, b, c, d) = map (intToDigit . boolToInt) [a, b, c, d]

nibbleToInt :: Nibble -> Int
nibbleToInt (a,b,c,d) = boolToInt a * 8 + boolToInt b * 4 + boolToInt c * 2 + boolToInt d

nibbleToComplement :: Nibble -> Int
nibbleToComplement (a, b, c, d) = 
    let value = boolToInt b * 4 + boolToInt c * 2 + boolToInt d
    in if a then value - 8 
        else value

showNibble :: Nibble -> String
showNibble nibble = 
    let binString = nibbleToString nibble
        number = nibbleToInt nibble
        compl = nibbleToComplement nibble
    in binString ++ " " ++ show number ++ " " ++ show compl

-- task01.02
bitAdder :: Bool -> Bool -> Bool -> (Bool, Bool)
bitAdder x y z = (c, s)
    where
        sA = (x || y) && (not (x && y))
        cA = x && y
        cB = sA && z
        s = (sA || z) && (not (sA && z))
        c = cA || cB

-- task01.03
nibbleAdder :: Nibble -> Nibble -> (Bool, Nibble)
nibbleAdder (a, b ,c, d) (e, f, g, h) =
    let (c1, s1) = bitAdder a e False
        (c2, s2) = bitAdder b f c1
        (c3, s3) = bitAdder c g c2
        (c, s4) = bitAdder d h c3
    in (c, (s1, s2, s3, s4))

-- task01.04
tableAdder :: (Nibble -> Nibble -> (Bool, Nibble))-> [(Nibble, Nibble )] -> String
tableAdder _ [] = ""
tableAdder f [(n1, n2)] = 
    let (c, n) = f n1 n2
    in showNibble n1 ++ " + " ++ showNibble n2 ++ " = " ++ show c ++ " " ++ showNibble n
tableAdder f ((n1, n2):xs) =
    let (c, n) = f n1 n2
    in showNibble n1 ++ " + " ++ showNibble n2 ++ " = " ++ show c ++ " " ++ showNibble n ++ "\n" ++ tableAdder f xs

main :: IO ()
main = putStrLn $ tableAdder nibbleAdder [((True, False, False, True), (False, False, False, True))]
