leastCommonMultiple :: Integer -> Integer -> Integer
leastCommonMultiple m n = (m*n) `div` (greatestCommonDivisor m n)

greatestCommonDivisor :: Integer -> Integer -> Integer
greatestCommonDivisor m n = if n == 0 then m else greatestCommonDivisor n (mod m n)

main = putStrLn $ show $ foldl lcm 1 [2 .. 20]
