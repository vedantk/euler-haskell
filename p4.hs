import Shared

import qualified Data.Set as Set

palindrome :: Integer -> Bool
palindrome n = all (== 0) $ zipWith (-) digits (reverse digits)
    where digits = toDigits n

base = [100 .. 999]

domain :: Set.Set Integer
domain = Set.fromList [i*j | i <- base, j <- base]

main = putStrLn $ show $ Set.findMax (Set.filter palindrome domain)
