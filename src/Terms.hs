data Term = TmVar Int
        | TmAbs Term
        | TmApp Term Term
        deriving (Show)


main :: IO ()
main = do
    let x = TmVar 0
    let y = TmVar 1
    let term = TmApp (TmAbs x) y
    print term