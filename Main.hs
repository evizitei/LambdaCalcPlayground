import Src.Terms as Terms

printTerm :: Term -> List -> String
printTerm (TmAbs info name bodyTerm) ctx = 
    let (ctx', name') = pickFreshName ctx name in
    "(λ" ++ name' ++ ". " ++ printTerm(bodyTerm ctx') ++ ")"
printTerm (TmVar info index depth) ctx = "TmVar " ++ show info ++ " " ++ show index ++ " " ++ show depth

main :: IO ()
main = do
    let term = (TmApp (Info "L1") 
          (TmAbs (Info "L2") 
          (TmVar (Info "L4") 1 (Depth 0))
        )
    print term