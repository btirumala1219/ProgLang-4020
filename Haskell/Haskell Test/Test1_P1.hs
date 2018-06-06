isPrime k = null [ x | x <- [2..k - 1], k `mod`x  == 0]

factors y = [x | x <- [1..y], y `mod` x == 0]

problemOne n = [ n | n <- [1..n], (n `mod` 5 == 0) || (isPrime n) || (length(factors n) == 3)]
