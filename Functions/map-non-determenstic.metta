;map -- applies a function to all the contents of an expression
;        -- (map half (2 4 6 )) -> (1 2 3)


(= (half $x) (/ $x 2))
(= (multiply $y) (* $y 2)) 
(= (map-nd $operation $expression)
   ($operation (superpose $expression)) 
)

!(map-nd half (10))
!(map-nd multiply (10))
!(map-nd half (2 4 6))  
!(map-nd multiply (2 4 6))  
!(map-nd half ()) 

