;map -- applies a function to all the contents of an expression

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

