;returns the length of an expression

(=(length $expression)
   (
    if (== $expression ())
        0
        (+ 1 (length(cdr-atom $expression)))
   )
)

!(length(1 2 3 4 5 6 7 8 ))