import Data.List (intercalate)

data Literal
    = Atom { atomChar :: Char }
    | NegA { atomChar :: Char }
    deriving Eq

instance Show Literal where
    show (Atom a) = [a]
    show (NegA a) = ['!', a]

data Clause = Clause [Literal]

data CNF = CNF [Clause]

-- task01.01

instance Show Clause where
    show (Clause literals) = "(" ++ intercalate " v " (map show literals) ++ ")"

instance Show CNF where
    show (CNF clause) = intercalate " ^ " (map show clause)

a = Clause [NegA 'A', Atom 'B']
b = Clause [NegA 'B', s 'C', Atom 'D']
c = CNF [a,b]

-- task01.02
fromClause :: Clause -> [Literal]
fromClause (Clause literals) = literals

fromCNF :: CNF -> [Clause]
fromCNF (CNF clause) = clause

-- task01.03
alphaL :: [Literal] -> Literal -> Bool
alphaL [] _ = False
alphaL (x:xs) y = 
    if x == y then True
    else alphaL xs y

alpha = alphaL [NegA 'A', Atom 'B', NegA 'C']

-- task01.04
alphaC :: (Literal -> Bool) -> Clause -> Bool
alphaC f (Clause literals) = any f literals

alphaCNF :: (Literal -> Bool) -> CNF -> Bool
alphaCNF f (CNF clauses) = all (alphaC f) clauses


main :: IO ()
main = do
    print a
    print b
    print $ atomChar (Atom 'A')
    print $ atomChar (NegA 'B')
    print $ Atom 'A'
    print $ NegA 'B'
