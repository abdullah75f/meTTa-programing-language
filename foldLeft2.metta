;; This is not working , why?
;(=(foldLeft $accumulator $operator () ) ($accumulator))
;(=(foldLeft $accumulator $operator $xs )
 ;  (foldLeft ($operator ($car-atom $xs) $accumulator ) $operator (cdr-atom $xs))     
 ;)



(= (foldLeft $accumulator $operator $xs)
    (if (== $xs ())
        $accumulator
        (foldLeft ($operator $accumulator (car-atom $xs) ) $operator (cdr-atom $xs))
    )
)



! (foldLeft 0 - (1 2 3 4 ))




