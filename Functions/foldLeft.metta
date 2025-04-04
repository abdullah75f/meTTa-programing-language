;fold-left -- folds an expression from left to right using a function 

; For test case purpose
(= (& True True) True)
(= (& True False) False)
(= (& False True) False)
(= (& False False) False)

(= (fold-left - ()) 0)
(= (fold-left & ()) True)
(= (fold-left $operation (:: $x ())) $x)
(= (fold-left $operation (:: $x (:: $y $xs))) 
    (fold-left $operation (:: ($operation $x $y) $xs)))


!(fold-left - ())
!(fold-left - (:: 1 (:: 2 (:: 3 (:: 4 (:: 8 (:: 9 ())))))))
!(fold-left & (:: True (:: False (:: False ()))))