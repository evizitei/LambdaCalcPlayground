-- Chapter 
module Src.LambdaCalc where

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


-- use the max version of current name stream, get one value higher
newHint :: Name -> Name
newHint (Nm chr idx) = Nm chr (idx + 1)

actualFreshName :: [Name] -> Name -> Name
actualFreshName ctx hint = 
    case ctx of
        [] -> hint
        (head:otherNames) -> 
            let collision = nameCollision head hint in
            if collision then
                actualFreshName otherNames (newHint head)
            else
                actualFreshName otherNames hint

pickFreshName :: [Name] -> Name -> ([Name], Name)
pickFreshName ctx hint = 
    let freshName = actualFreshName ctx hint in
    (freshName:ctx, freshName)

indexToName :: Index -> [Name] -> String
indexToName (Index i) ctx = 
    let ctxLen = length ctx in
    if i < ctxLen then
        let Nm chr idx = (ctx !! i) in
        chr ++ show idx
    else
        "[BAD I2N INDEX]"

printTerm :: Term -> [Name] -> String
printTerm (TmAbs name bodyTerm) ctx = 
    let (ctx', name') = pickFreshName ctx name in
    let bodyStr = printTerm bodyTerm ctx' in
    let Nm n_chr n_idx = name' in
    "(lambda " ++ (n_chr ++ show n_idx) ++ ". " ++ bodyStr ++ ")"
printTerm (TmApp t1 t2) ctx =
    let t1Str = printTerm t1 ctx in
    let t2Str = printTerm t2 ctx in
    "(" ++ t1Str ++ " " ++ t2Str ++ ")"
printTerm (TmVar index (Depth dInt)) ctx = 
    let ctxLen = length ctx in
    if ctxLen == dInt then
        indexToName index ctx
    else
        "[BAD DEPTH INDEX]"