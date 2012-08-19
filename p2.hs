import Shared

evenFibs = [k | k <- fibs, even k]

main = putStrLn $ show $ sum (takeWhile (< 4000000) evenFibs) 
