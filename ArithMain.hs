import Src.ArithExpr as ArithExpr

main :: IO ()
main = do
    print (normalForm TmTrue)
    print (normalForm TmFalse)
    print (normalForm (TmIf TmTrue TmZero (TmSucc TmZero)))
    print (normalForm (TmIf TmFalse TmZero (TmSucc TmZero)))
    print (normalForm (TmIsZero TmZero))
    print (normalForm (TmIsZero (TmSucc TmZero)))
    print (normalForm (TmPred TmZero))
    print (normalForm (TmPred (TmSucc TmZero)))
    print (normalForm (TmPred (TmSucc (TmSucc TmZero))))
    print (normalForm (TmPred (TmSucc (TmSucc (TmSucc TmZero)))))
    print (normalForm (TmPred (TmSucc (TmSucc (TmSucc (TmSucc TmZero))))))
    print (normalForm (TmPred (TmSucc (TmSucc (TmSucc (TmSucc (TmSucc TmZero)))))))
    