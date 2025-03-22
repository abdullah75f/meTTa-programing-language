; fold-right -- folds an expression from right to left using a function 
;E.g:   -- (fold-right add (1 2 3 4)) -> 10
        -- (fold-right and (True False False)) -> False

; For test case purpose , definition for logical AND  operator
(= (& True True) True)
(= (& True False) False)
(= (& False True) False)
(= (& False False) False)


; Base case: empty list
(= (fold-right $operation ()) 0)

; Test case with +
!(fold-right + ())

; Recursive case: non-empty list
(= (fold-right $operation (:: $x $xs)) 
    ($operation $x (fold-right $operation $xs)))
        

; Test case with +
!(fold-right + (:: 1 (:: 2 (:: 3 (:: 4 (:: 8 (:: 9 ())))))))
;!(fold-right (& (:: True (:: False (:: False ()))) True))



