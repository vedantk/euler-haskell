import Shared

main = putStrLn $ show $ sum (takeWhile (< 2000000) primes)
