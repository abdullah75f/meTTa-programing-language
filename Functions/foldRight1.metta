; Base case
(= (foldRight + ()) 0)
(= (foldRight - ()) 0)
(= (foldRight / ()) 1)
(= (foldRight * ()) 1)

; recursive case
( = (foldRight $operation $xs) 
    ($operation (car-atom $xs) (foldRight $operation (cdr-atom $xs)))
)

! (foldRight + (1 2 3 4))
! (foldRight - (1 2 3 4))
! (foldRight * (1 2 3 4))