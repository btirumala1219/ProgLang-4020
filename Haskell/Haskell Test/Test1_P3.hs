lastN :: Int -> [a] -> [a]
lastN n xs = drop (length xs - n) xs

firstN :: Int -> [a] -> [a]
firstN n xs = take n xs


splitMe a b xs = return ((firstN a xs),(lastN b xs))
