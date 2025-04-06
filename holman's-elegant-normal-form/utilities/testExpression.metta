
(= (testExpression $expr)
    (let $head (car-atom $expr)
        (if (term $head)
            $expr
            (let $intermediate (car-atom $expr)
                $intermediate
            )
        )
    )
)
;! (testExpression ((a b)))

;! (term A)