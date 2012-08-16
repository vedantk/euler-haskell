import qualified Data.Set as Set

palindrome :: Integer -> Bool
palindrome n = all (== 0) $ zipWith (-) digits (reverse digits)
    where
        nrdigits :: Integer
        nrdigits = floor (logBase 10 (fromIntegral n)) + 1

        digits :: [Integer]
        digits = map floor (take (fromIntegral nrdigits) quotients)
        
        quotients :: [Rational]
        quotients = iterate nextQuot ((fromIntegral n) / (10^(nrdigits-1)))

        nextQuot :: Rational -> Rational
        nextQuot q = 10.0 * (q - (fromIntegral $ floor q))

base :: [Integer]
base = [100 .. 999]

cross :: [Integer] -> [Integer] -> [(Integer, Integer)]
cross a b = concat $ map (\ m -> map (\ n -> (m, n)) b) a

domain :: Set.Set Integer
domain = Set.fromList $ map (\ (a,b) -> a*b) (cross base base)

main = putStrLn $ show $ Set.findMax (Set.filter palindrome domain)
