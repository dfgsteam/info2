sumD :: Int -> [Int] -> Int
sumD n x =
    if n == 0 then 0
    else (x !! (n-1)) * 2 ^ (n-1) + sumD (n-1) x

calcZ :: Int -> [Int] -> Int
calcZ n x =  sumD (n-1) x -(x !! (n-1)) * 2 ^ (n-1) +

main :: IO ()
main = do
    let list = [1, 1, 1, 1]
    let result = sumD (length list) list
    print result

    let result2 = calcZ (length list) list
    print result2