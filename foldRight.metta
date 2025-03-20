; 1 - fold-right -- folds an expression from right to left using a function 
;E.g:   -- (fold-right add (1 2 3 4)) -> 10
        -- (fold-right and (True False False)) -> False

; For test case purpose , definition for logical AND  operator
(= (& True True) True)
(= (& True False) False)
(= (& False True) False)
(= (& False False) False)



; Base case: empty list
(=(fold-right ($operation () $init)) $init)

; Recursive case: non-empty list
(= (fold-right ($operation (:: $x $xs) $init)) 
    ($operation $x (fold-right ($operation $xs $init)) ))
        

; Test case with +
!(fold-right (+ (:: 1 (:: 2 (:: 3 (:: 4 ())))) 0))
!(fold-right(+ () 0))
!(fold-right (& (:: True (:: False (:: False ()))) True))



