;map -- applies a function to all the contents of an expression
;        -- (map half (2 4 6 )) -> (1 2 3)

(= (half $x) (/ $x 2))
; !(half 2)

(: map (-> (-> A B) Expression Expression))

(= (map $function $expression)
   (if (== $expression ()) ; Correct 'if' call
       () ; Base Case
       ; Recursive Step - Correct 'cons-atom' call
       (cons-atom
          ($function (car-atom $expression))
          (map $function (cdr-atom $expression))
       )
   )
)

; Test map
!(map half (2 4 6))
!(map half ())
!(map half (10))