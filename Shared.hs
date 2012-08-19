module Shared where

import qualified Data.Set as Set
import Control.Parallel.Strategies

allmap :: (a -> Bool) -> [a] -> Bool
allmap pred li = all id (map pred li)

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

fib :: Integer -> Integer
fib 0 = 1
fib 1 = 2
fib n = computeFib 1 2 n
    where
        computeFib :: Integer -> Integer -> Integer -> Integer
        computeFib a b n = if n == 1 then b else computeFib b (a+b) (n-1)

isqrt :: (Integer -> Integer)
isqrt = round . sqrt . (fromIntegral :: Integer -> Double)

generateDivisors :: Integer -> [Integer]
generateDivisors n = [2] ++ [3, 5 .. isqrt n]

prime :: Integer -> Bool
prime 1 = False
prime n = allmap (\ d -> (mod n d) /= 0 || n == d) (generateDivisors n)

primeFactorsOf :: Integer -> Set.Set Integer
primeFactorsOf n =
    if prime n then Set.singleton n
    else Set.unions $ map primeFactorsOf factors
        where
            lhsFactors = filter (\ d -> (mod n d) == 0) (generateDivisors n)
            factors = lhsFactors ++ map (\ f -> n `div` f) lhsFactors

primes :: [Integer]
primes = 2 : iterate nextPrime 3
    where nextPrime k = head $ filter isPrime [k + 2, k + 4 ..]
          isPrime k = allmap (\ d -> (mod k d) /= 0) (takeWhile (\ p -> p^2 <= k) primes)
          
toDigits :: Integer -> [Integer]
toDigits n = map floor (take (fromIntegral nrdigits) quotients)
    where
        nrdigits :: Integer
        nrdigits = floor (logBase 10 (fromIntegral n)) + 1

        quotients :: [Rational]
        quotients = iterate nextQuot ((fromIntegral n) / (10^(nrdigits-1)))

        nextQuot :: Rational -> Rational
        nextQuot q = 10.0 * (q - (fromIntegral $ floor q))

cross :: [a] -> [a] -> [(a, a)]
cross a b = [(i,j) | i <- a, j <- b]

-- XXX: May be flaky around 10^1000.
ilogBase :: Integer -> Integer -> Integer
ilogBase base num = toInteger $ length $ takeWhile (> 1) quotients
    where quotients = iterate (\ x -> x `div` base) num
