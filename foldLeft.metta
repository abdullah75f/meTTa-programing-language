;fold-left -- folds an expression from left to right using a function 

; For test case purpose , definition for logical AND  operator
(= (& True True) True)
(= (& True False) False)
(= (& False True) False)
(= (& False False) False)

;base case
(= (fold-left ($operator $init ())) $init )
; recursive case
(= (fold-left ($operator $init (:: $x $xs))) 
   (fold-left ($operator ($operator $init $x) $xs)))



; Test case with -
!(fold-left (- 0 (:: 1 (:: 2 (:: 3 (:: 4 ()))))))
!(fold-left(-  0 () ))
!(fold-left (&  True (:: True (:: False (:: False ()))) ))
