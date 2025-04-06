(= (term $atom)
    ; identifies literals like A B (NOT A)
    (if (== (get-metatype $atom) Symbol)
        True
        (let $head (car-atom $atom)
            (if (== $head NOT)
                True
                False
            )
        )
    )
)