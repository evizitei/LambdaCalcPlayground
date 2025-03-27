-- Chapter 
module Src.Terms where

newtype Index = Index Int deriving (Show)
newtype Depth = Depth Int deriving (Show)

-- like a0, a1, a2, etc
data Name = Nm String Int deriving (Show, Eq, Ord)

relatedNames :: Name -> Name -> Bool
relatedNames (Nm chra _) (Nm chrb _) = chra == chrb

nameCollision :: Name -> Name -> Bool
nameCollision exst@(Nm chr_a idx_a) hint@(Nm chr_b idx_b) = chr_a == chr_b && idx_a >= idx_b

data Term = TmVar Index Depth
    | TmAbs Name Term
    | TmApp Term Term
    deriving (Show)

