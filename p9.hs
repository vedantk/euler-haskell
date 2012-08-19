pythagorean :: Integer -> Integer -> Integer -> Bool
pythagorean a b c = (a < b && b < c) && (a^2 + b^2) == c^2 

pythagoreanTriples :: Integer -> [(Integer, Integer, Integer)]
pythagoreanTriples k = [(a,b,c) | a <- [2 .. k], b <- [a .. k], c <- [b .. k], pythagorean a b c]

main = putStrLn $ show $ (x*y*z, (x, y, z))
    where (_, (x, y, z):xs) = break (\ (a, b, c) -> a + b + c == 1000) (pythagoreanTriples 1000)
