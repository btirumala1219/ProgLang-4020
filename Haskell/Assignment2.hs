fib n = sum (go n 1 2) + 3
  where
  go n f s
    | (f+s) > n = []
    | otherwise = if even (f+s) then(f+s) : go n s (f+s) else go n s (f+s)

oddSum n = sum (mult n)
  where
  mult n = [n | n <- [1..n], n `mod` 3 == 0, n `mod` 7 == 0, n `mod` 2 == 1]

check n = length([n | n <- [1..n], length(divisors n) == 7])
  where divisors n = [x | x <- [1..(n-1)], n `rem` x == 0]
