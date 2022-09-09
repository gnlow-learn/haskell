quicksort [] = []
quicksort (x:xs) = quicksort ys ++ [x] ++ quicksort zs
            where
                ys = [a | a <- xs, a <= x]
                zs = [b | b <- xs, b > x]

quicksort2 xs = case xs of
    [] -> []
    (x:xs) -> quicksort ys ++ [x] ++ quicksort zs
        where
            ys = [a | a <- xs, a <= x]
            zs = [b | b <- xs, b > x]