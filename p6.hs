square :: Integer -> Integer
square k = k ^ 2

diff :: Integer -> Integer
diff n = (square $ sum [1 .. n]) - (sum $ map square [1 .. n])

main = putStrLn $ show $ diff 100
