-- Barath Tirumala Assignment 3

module CaesarCipher where

import Data.Char
import Data.List


nlowers = length ['a'..'z']

-- convert letter to int
let2nat :: Char -> Int
let2nat c = ord c - ord 'a'

-- convert int to letter
nat2let:: Int -> Char
nat2let n = chr (ord 'a' + n)

-- shift letter
shift :: Int -> Char -> Char
shift n c | isLower c = nat2let ((let2nat c + n) `mod` nlowers)
          | otherwise      = c

-- encode
encode :: Int -> String -> String
encode n cs = [shift n c | c <- cs]

-- decode
decode :: Int -> String -> String
decode n cs = [shift (26-n) c | c <- cs]


table :: [Float]
table = [8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4,
        6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.1, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

-- counts how many lower
lowers :: String -> Int
lowers m = length (filter (isLower) m)

-- counts how many of a char
count :: Char -> String -> Int
count c str = length $ filter (== c) str

-- calculates pecent
percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromIntegral m) * 100

-- frequency table
freqs :: String -> [Float]
freqs cs = [percent (count c cs) n | c <- ['a'..'z']]
    where n = lowers cs
          lowers cs = length [c | c <- cs, isLower c]
          count c cs = length [c' | c' <- cs, c == c']

-- chi-square
-- os : observed frequencies list, es : expected frequencies list
chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o - e) ^ 2) / e | (o,e) <- zip os es]

-- rotates the element


-- n: 0 .. length of xs
rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs

-- finds position
position :: Eq a => a -> [a] -> [Int]
position c cs = [i | (c', i) <- zip cs [0..n], c == c']
    where n = length cs - 1

-- find most likely shift factor that was used to encode the string and try
-- decoding the string
crack :: String -> String
crack cs = encode (-factor') cs
    where factor' = head $ position (minimum chitable) chitable
          chitable = [chisqr (rotate n table') table | n <- ns]
          table' = freqs cs
          ns = [0..(nlowers - 1)]
