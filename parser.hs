type Parser a = String -> [(a, String)]

item :: Parser Char
item xs = case xs of
    [] -> []
    (x:xs) -> [x, xs]