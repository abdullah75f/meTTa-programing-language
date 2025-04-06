!(register-module! ./utilities)
!(import! &self utilities:map)
!(import! &self utilities:length)
!(import! &self utilities:testExpression)
!(import! &self utilities:term)



(= (orCut $expr)
    (if (term $expr)
        $expr
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
        )
        (if (== $head OR)
            (let $num (length $tail)  
                (if (== $num 1)
                    (let 
                        $child (testExpression $tail)
                        
                        (if (== (length $child) 1)
                            $child
                            (cdr-atom $child)
                        )
                    )
                    (let $reducted (map orCut $tail)
                        (cons-atom $head $reducted)
                    )
                )
            )
            (if (== (length $tail) 1)
                (let* (
                    ($innerTail (testExpression $tail))
                    ($inner (orCut $innerTail))
                    )
                    (cons-atom $head $inner)
                )
                ;check for OR nodes in the rest of the expression
                (let $inner-expr (map orCut $tail)
                    (cons-atom $head $inner-expr)
                )
            )
        )
    )
    )
)


! (orCut (OR B)); (B)
! (orCut (OR (NOT B))); (NOT B)
! (orCut (OR (NOT B) D)); (OR (NOT B) D) "No reduction"
! (orCut (OR (AND B C (AND C F)))); (B C (AND C F)) "grand child of the POA"
! (orCut (AND (OR (NOT A)))); (AND (NOT A))
! (orCut (AND (OR (NOT A)) (AND A))); (AND (NOT A) (AND A))
! (orCut (AND B (OR (AND A (OR B)) (AND B (OR A)))))