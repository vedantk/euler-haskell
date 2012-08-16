import qualified Data.Set as Set

isqrt :: (Integer -> Integer)
isqrt = round . sqrt . (fromIntegral :: Integer -> Double)

generateDivisors :: Integer -> [Integer]
generateDivisors n = [2] ++ [3, 5 .. isqrt n]

prime :: Integer -> Bool
prime 1 = False
prime n = all id (map (\ d -> (mod n d) /= 0 || n == d) (generateDivisors n))

primeFactorsOf :: Integer -> Set.Set Integer
primeFactorsOf n =
    if prime n then Set.singleton n
    else Set.unions $ map primeFactorsOf factors
        where
            lhsFactors = filter (\ d -> (mod n d) == 0) (generateDivisors n)
            factors = lhsFactors ++ map (\ f -> n `div` f) lhsFactors

main = putStrLn $ show $ primeFactorsOf 600851475143
