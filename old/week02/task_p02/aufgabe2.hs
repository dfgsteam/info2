type Nibble = (Bool, Bool, Bool, Bool)
type BinNum = (Int, Int, Int, Int)      --Hilfstyp zur Umwandlung von dem Bool TUpel zu Int Tupel

----------------------------------------
showNibble :: Nibble -> String          --showNibble für Teilaufgabe 1
showNibble (a,b,c,d) = show(booltoInt a) ++ show(booltoInt b) ++ show(booltoInt c) ++ show(booltoInt d) ++ "  " ++ show(binToInt(turnToDecimal (a,b,c,d))) ++ "  " ++ show(binToNegative(turnToDecimal (a,b,c,d)))
-----------------------------------------
booltoInt :: Bool -> Int       --Hilfsfunktion zur Umwandlung von Bool zu Int
booltoInt True = 1
booltoInt False = 0

turnToDecimal :: Nibble -> BinNum       --BoolTupel zum Int Tupel (Hilfsfunktion)
turnToDecimal (a,b,c,d) = (booltoInt a, booltoInt b, booltoInt c, booltoInt d)

binToInt :: BinNum -> Int           --Hilfsfunktion zur Umwandlung eines Binären Tupels in einen DezimalWert
binToInt (a,b,c,d) = d * (twoPowerOf 0) + c * (twoPowerOf 1) + b * (twoPowerOf 2) + a * (twoPowerOf 3)

twoPowerOf :: Int -> Int        --eigene Powerof Funktion für 2 hoch
twoPowerOf 0 = 1
twoPowerOf 1 = 2
twoPowerOf n
    | (n `mod` 2 == 0) = twoPowerOf (n `div` 2) * twoPowerOf (n `div` 2)
    | otherwise = twoPowerOf(n `div` 2) * twoPowerOf(n `div` 2) * 2


binToNegative :: BinNum -> Int      --Bildung des Komplements 
binToNegative (a,b,c,d) = binToInt (a,b,c,d) - (2 * a * twoPowerOf 3)



{--------------------------------------------------------------------------------------}

-----------------------------------------------------
bitAdder :: Bool -> Bool -> Bool -> (Bool, Bool)        --Funktion zur Realisierung von 1-Bit Addierung
bitAdder x y z = ((x && y) || ((x ||| y) && z), (x ||| y) ||| z)
-----------------------------------------------------

(|||) :: Bool -> Bool -> Bool   --XOR als Hilfsfunktion
True ||| True = False
a ||| b = a || b

----------------------------------------------------------
nibbleAdder :: Nibble -> Nibble -> (Bool, Nibble) --realisiert einen 4-Bit-Addierer, basierend auf dem BitAdder
nibbleAdder (x1, x2,x3, x4) (y1, y2, y3,y4) = (a1, (a2, a3, a4, a5))
    where
        a1 = fst (bitAdder x1 y1 (fst (bitAdder x2 y2 (fst (bitAdder x3 y3 (fst (bitAdder x4 y4 False)))))))
        a2 = snd (bitAdder x1 y1 (fst (bitAdder x2 y2 (fst (bitAdder x3 y3 (fst (bitAdder x4 y4 False)))))))
        a3 = snd (bitAdder x2 y2 (fst (bitAdder x3 y3 (fst (bitAdder x4 y4 False)))))
        a4 = snd (bitAdder x3 y3 (fst (bitAdder x4 y4 False)))
        a5 = snd (bitAdder x4 y4 False)
-----------------------------------------------------------


--nun komt die Testfunktion
-----------------------------------------------------------
tableAdder :: (Nibble -> Nibble -> ( Bool , Nibble )) -> [(Nibble , Nibble)] -> String
tableAdder function [((x1, x2, x3, x4), (y1, y2, y3, y4))] = showNibble a1 ++ " + " ++ showNibble a2 ++ " = " ++ show (fst sum) ++ " " ++ showNibble (snd sum) ++ "\n"
    where
        a1 = (x1, x2, x3, x4)
        a2 = (y1, y2, y3, y4)
        sum = function a1 a2
-----------------------------------------------------------
