fib = [ x | x <- takeWhile (<= 1000000) fibs]
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)


firstN :: Int -> [a] -> [a]
firstN n xs = take n xs

factorial 0 = 1
factorial n = factorial (n - 1) * n

fact n = [(factorial x) | x <- [1..n]]

numfibs n = [y | y <- (firstN n fib)]

common xs ys = [ x | x <- xs , y <- ys, x == y]

probTwo n = common (numfibs n) (fact n)
