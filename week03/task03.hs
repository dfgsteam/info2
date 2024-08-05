data Prozess = Prozess { pid :: String
                        , arrival :: Int
                        , computing :: Int } deriving ( Show )

instance Eq Prozess where
    Prozess { computing = a } == Prozess { computing = b } = a == b

instance Ord Prozess where
    compare x y
        | computing x < computing y = LT
        | computing x > computing y = GT
        | otherwise = EQ

data State = State { new :: [ Prozess ]
                    , run :: Prozess
                    , ready :: [ Prozess ]
                    , time :: Int
                    , chart :: String }

-- task01-01
instance Show State where
    show s = 
        "State {\n" ++
        "  new: " ++ show (new s) ++ ",\n" ++
        "  run: " ++ show (run s) ++ ",\n" ++
        "  ready: " ++ show (ready s) ++ ",\n" ++
        "  time: " ++ show (time s) ++ ",\n" ++
        "  chart: " ++ show (chart s) ++ "\n" ++
        "}"

ps = [Prozess{pid="P1", arrival=0, computing=1},Prozess{pid="P2", arrival=2, computing=2}]
idle = Prozess{pid="IDLE", arrival=(-1), computing=(-1)}
lectureExample = State { new = ps
                            , run = idle
                            , ready =[]
                            , time =0
                            , chart = " " }

-- task01.02
getStateNew :: State -> [ Prozess ]
getStateNew a = new a

getStateReady :: State -> [ Prozess ]
getStateReady a = ready a

getTime :: State -> Int
getTime a = time a

addToList :: Prozess -> [Prozess] -> [Prozess]
addToList e xs = xs ++ [e]

checkElementIsReadyList :: [Prozess] -> [Prozess] -> [Prozess] -> Int -> ([Prozess], [Prozess])
checkElementIsReadyList [] waitList newList _ = (waitList, newList)
checkElementIsReadyList (x:xs) waitList newList t =
    let 
        waitList' = if arrival x <= t then addToList x waitList else waitList
        newList' = if arrival x > t then addToList x newList else newList
    in checkElementIsReadyList xs waitList' newList' t

update_ready :: State -> State
update_ready x =
    let oldElements = getStateNew x
        readyElements = getStateReady x
        currentTime = getTime x
        (readyList, newList) = checkElementIsReadyList oldElements [] readyElements currentTime
    in x { new = newList, ready = readyList}

-- task01.03

getRunElement :: State -> Prozess
getRunElement x = run x

update_run :: State -> State 
update_run x =
    let
        readyElements = getStateReady x
        
        newRunElement = if length readyElements > 0 then head readyElements
                        else idle
        newReadyElements = if length readyElements > 1 then tail readyElements
                        else []
    in x { run = newRunElement, ready = newReadyElements}
        
lectureExample2 = update_ready lectureExample
lectureExample3 = update_ready lectureExample2

-- task01.04
update_time :: State -> State
update_time x = 
    let 
        newTime = (getTime x) + 1 
        currentRunElement = getRunElement x
        
        potentialUpdate = update_run x

        newRunElement = if computing currentRunElement <= 1 then getRunElement potentialUpdate
                            else currentRunElement {computing = (computing currentRunElement) - 1}
        newReadyElement = if  computing currentRunElement <= 1 then getStateReady potentialUpdate
                            else getStateReady x

        newX = x { run = newRunElement, ready = newReadyElement, time = newTime}

        tempX = update_ready newX

        newChart = pid (run tempX)


    in tempX {chart = newChart}

-- task01-05

-- -> task01-5

lectureExample01 = lectureExample
lectureExample02 = update_time lectureExample01
lectureExample03 = update_time lectureExample02
lectureExample04 = update_time lectureExample03
lectureExample05 = update_time lectureExample04
lectureExample06 = update_time lectureExample05