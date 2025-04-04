;filter  -- filter contents of an expression based on a predicate
;        -- the predicate, given as a function input, could be any thing like 
;        (filter isEven (1 2 3 4 5)) -> (2 4)

(: isEven (-> Number Bool))
(=(isEven $x) (==(% $x 2) 0))

(: isOdd (-> Number Bool))
(=(isOdd $x) (==  (% $x 2) 1 ))

(: filter (-> (-> Number Bool) Expression expression))

(=(filter $predicate $expression)
  (if (== $expression ())
      () ; Base case when empty list
      (
        let* (
                ($head (car-atom $expression))
                ($tail (cdr-atom $expression))
                ($filter-recurssion (filter $predicate $tail))
              )
              (
                if($predicate $head)
                (cons-atom $head $filter-recurssion)
                $filter-recurssion
              )
      )
  )
)

; Test Cases

; Test with isEven predicate
! (filter isEven (1 2 3 4 5 6 7 8 9 10))

; Test with isOdd predicate
! (filter isOdd (1 2 3 4 5 6 7 8 9 10))






