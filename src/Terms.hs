module Src.Terms where

data Term = TmVar Int
    | TmAbs Term
    | TmApp Term Term
    deriving (Show)

