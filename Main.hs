import Src.Terms as Terms

-- use the max version of current name stream, get one value higher
newHint :: Name -> Name
newHint (Nm chr idx) = Nm chr (idx + 1)

actualFreshName :: [Name] -> Name -> Name
actualFreshName ctx hint = 
    case ctx of
        [] -> hint
        (head:otherNames) -> 
            let collision = nameCollision(head, hint) in
            if collision then
                actualFreshName names (newHint head)
            else
                actualFreshName names hint

printTerm :: Term -> [Name] -> String
printTerm (TmAbs info name bodyTerm) ctx = 
    let (ctx', name') = pickFreshName ctx name in
    "(λ" ++ name' ++ ". " ++ printTerm(bodyTerm ctx') ++ ")"
printTerm (TmVar info index depth) ctx = "TmVar " ++ show info ++ " " ++ show index ++ " " ++ show depth

main :: IO ()
main = do
    let term = TmVar (Index 0) (Depth 0)
    print term