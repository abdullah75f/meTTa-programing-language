; 1 - fold-left -- folds an expression from left to right using a function 

(= (fold-left ($operator $init ())) $init )





; test case
!(fold-left (+ 0 ()))