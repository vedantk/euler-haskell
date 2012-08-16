main = putStrLn $ show $ sum (filter correctMultiple [3 .. 999])
	where correctMultiple = (\ n -> (mod n 3) == 0 || (mod n 5) == 0)
