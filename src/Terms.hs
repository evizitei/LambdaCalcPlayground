module Src.Terms where

newtype Info = Info String deriving (Show)
newtype Index = Index Int deriving (Show)
newtype Depth = Depth Int deriving (Show)
newtype Name = Name String deriving (Show)

data Term = TmVar Info Index Depth
    | TmAbs Info Name Term
    | TmApp Info Term Term
    deriving (Show)

