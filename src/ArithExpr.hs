
-- Chapter 4 of Types and Programming Languages, "Arithmetic Expressions"
module Src.ArithExpr where

data Term = TmTrue 
  | TmFalse
  | TmIf Term Term Term
  | TmZero
  | TmSucc Term
  | TmPred Term
  | TmIsZero Term
  deriving (Show)

isNumericVal :: Term -> Bool
isNumericVal TmZero = True
isNumericVal (TmSucc t) = isNumericVal t
isNumericVal _ = False

isVal :: Term -> Bool
isVal TmTrue = True
isVal TmFalse = True
isVal t = isNumericVal t

normalForm :: Term -> Term
normalForm (TmIf t1 t2 t3) = 
    case t1 of
        TmTrue -> t2
        TmFalse -> t3
        _ -> normalForm(TmIf (normalForm t1) t2 t3)
normalForm (TmSucc t1) = TmSucc (normalForm t1)
normalForm (TmPred t1) = 
    case t1 of
        TmZero -> TmZero
        TmSucc n -> n
        _ -> normalForm(TmPred (normalForm t1))
normalForm (TmIsZero t1) = 
    case t1 of
        TmZero -> TmTrue
        TmSucc n -> TmFalse
        _ -> normalForm(TmIsZero (normalForm t1))
normalForm t = t
