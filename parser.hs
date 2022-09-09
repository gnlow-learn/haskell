{-# LANGUAGE NoImplicitPrelude #-}

import Data.Char (Char)
import Data.String (String)

type Parser a = String -> [(a, String)]

failure :: Parser a
failure = \xs -> []

return :: a -> Parser a
return v = \xs -> [(v, xs)]

item :: Parser Char
item = \xs -> case xs of
    [] -> []
    (x:xs) -> [(x, xs)]

p +++ q = \xs -> case p xs of
    [] -> parse q xs
    [(y, ys)] -> [(y, ys)]

parse p xs = p xs

(>>=) :: Parser a -> (a -> Parser b) -> Parser b
p >>= q = \xs -> case p xs of
    [] -> []
    [(y, ys)] -> parse (q y) ys

parseTwice :: Parser (Char, Char)
parseTwice = item >>= \x -> return (x, x)