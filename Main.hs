import Src.LambdaCalc



main :: IO ()
main = do
    let term = TmVar (Index 0) (Depth 1)
    let ctx = [Nm "a" 0]
    print(printTerm term ctx)
    let ldb = TmAbs (Nm "x" 0)(TmVar (Index 0) (Depth 1))
    let ctx2 = []
    print(printTerm ldb ctx2)