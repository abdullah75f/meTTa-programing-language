; Base case
(= (foldRight $operation ()) 0)

; recursive case
( = (foldRight $operation $xs) 
    ($operation (car-atom $xs) (foldRight $operation (cdr-atom $xs)))
)

! (foldRight - (1 2 3 4))
