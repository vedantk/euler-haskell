import Shared

primes :: [Integer]
primes = filter prime ([2] ++ [3, 5 ..])

main = putStrLn $ show $ primes !! 10000
