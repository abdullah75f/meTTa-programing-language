(: isEven (-> Number Bool))
(= (isEven $x) (== (% $x 2) 0))

(: isOdd (-> Number Bool))
(= (isOdd $x) (== (% $x 2) 1))

(: filter-nd (-> (-> Number Bool) Expression Expression))
(= (filter-nd $predicate $expression)
   (collapse                     
      (let $x (superpose $expression) 
         (if ($predicate $x)    
             $x                 
             Empty))))           

;  Test Cases 
! (filter-nd isEven (1 2 3 4 5 6 7 8 9 10 )) 
! (filter-nd isOdd (1 2 3 4 5 6 7 8 9 10))   