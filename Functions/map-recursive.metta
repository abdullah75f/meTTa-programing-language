;map -- applies a function to all the contents of an expression
;        -- (map half (2 4 6 )) -> (1 2 3)

(= (half $x) (/ $x 2))
; !(half 2)

(= (map $func $expr)
    (if (== $expr ())
        ()
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
            ($recursive-head ($func $head))
            ($recursive-tail (map $func $tail))
            )
            (cons-atom $recursive-head $recursive-tail)
        )
    )   
)

; Test case
!(map half (2 4 6))
!(map half ())
!(map half (10))

; a possible implementtion without the let binding
;(= (map $func $expr)
;    (if (== $expr ())
;        ()
;        (cons-atom ($func (car-atom $expr)) ((map $func (cdr-atom $expr))))
;    )   
;)