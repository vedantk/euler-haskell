import qualified Data.Map as Map

collatz :: Int -> Int
collatz k | even k = k `div` 2
collatz k = (3*k) + 1

trajectory :: Int -> Int
trajectory k = length $ takeWhile (> 1) (iterate collatz k)

trajectory' :: Int -> Map.Map Int Int -> (Int, Map.Map Int Int)
trajectory' 1 cache = (1, cache)
trajectory' k cache =
    case Map.lookup k cache of
        Just n -> (n, cache)
        Nothing -> (len, Map.insert k len rhsCache)
            where len = rhsLen + 1
                  (rhsLen, rhsCache) = trajectory' (collatz k) cache

maxTrajectory kbest tlen _ [] = (kbest, tlen)
maxTrajectory kbest tlen cache (k:ks) =
    let (klen, kcache) = trajectory' k cache
    in if klen > tlen
       then maxTrajectory k klen kcache ks
       else maxTrajectory kbest tlen kcache ks

main = putStrLn $ show $ maxTrajectory 0 0 Map.empty [1 .. 1000000]
