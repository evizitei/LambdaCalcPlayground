import Src.Terms as Terms

main :: IO ()
main = do
    let x = TmVar 0
    let y = TmVar 1
    let term = TmApp (TmAbs x) y
    print term