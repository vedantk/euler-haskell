import Data.Vector as Vec

paths 0 y = 1
paths x 0 = 1
paths x y = (paths (x-1) y) + (paths x (y-1))

main = do
    putStrLn $ show $ paths 3 3
