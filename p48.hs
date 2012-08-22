series = [k^k | k <- [1 .. 1000]]

main = do
    let z = show $ sum series
       in putStrLn $ drop ((length z) - 10) z
