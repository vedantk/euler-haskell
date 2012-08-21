import Shared

triangles = scanl (+) 1 [2 ..]

main = putStrLn $ show $ head $ dropWhile (\ t -> (length $ factorsOf t) < 500) triangles
