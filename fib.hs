fib :: Integer -> Integer
fib 0 = 1
fib 1 = 2
fib n = computeFib 1 2 n

computeFib :: Integer -> Integer -> Integer -> Integer
computeFib a b n = if n == 1
                   then b
                   else computeFib b (a+b) (n-1)

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main = putStrLn $ show (take 100 fibs)
