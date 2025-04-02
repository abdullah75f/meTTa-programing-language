;filter  -- filter contents of an expression based on a predicate
;        -- the predicate, given as a function input, could be any thing like 
;        (filter isEven (1 2 3 4 5)) -> (2 4)

(: filter isEven (-> Expression Expression))
(= (filter isEven $xs)
    (if (== $xs ())
        () ; Base case

        (let* (
                ($head (car-atom $xs))
                ($tail (cdr-atom $xs))
                ($filtered-tail (filter isEven $tail))
               )
          (
            if (== (% $head 2) 0)
              (cons-atom $head $filtered-tail)
              $filtered-tail
          )
        )
    )
)


! (filter isEven (1 2 3 4 5 6 7 8 9 10)) ; -> (2 4)


;filter  -- filter contents of an expression based on a predicate
;        -- the predicate, given as a function input, could be any thing like 
;        (filter isEven (1 2 3 4 5)) -> (2 4)

;(= (filter isEven $xs)
   ; (
    ;    if (== $xs ())
      ;      ()
     ;       (if (== (% (car-atom $xs) 2) 0 )
       ;         (cons-atom (car-atom $xs)
        ;        (filter isEven (cdr-atom $xs))
         ;       )
          ;      (filter isEven (cdr-atom $xs))
           ; )
    ;)
;)


;!  (filter isEven (1 2 3 4 5)) ;-> (2 4)