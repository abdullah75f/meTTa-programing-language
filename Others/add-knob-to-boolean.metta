;;Adds a single knob (Symbol) to an existing
;;boolean expression (`$expr`) using AND.

;; --- Define BoolExpr Type ---
(: True BoolExpr)
(: False BoolExpr)
(: NOT (-> BoolExpr BoolExpr))
(: AND (-> BoolExpr BoolExpr BoolExpr))
(: OR  (-> BoolExpr BoolExpr BoolExpr))

;; --- Type Definition for add-knob ---
;; It takes a BoolExpr and a Symbol (the knob name)
;; returns a new BoolExpr.
(: add-knob (-> BoolExpr Symbol BoolExpr))

;; --- Function Definition ---
(= (add-knob $expr $knob-name)
   (AND $expr $knob-name))


;; test cases

;; Add knob 'A' to the expression '(AND X Y)'
!(add-knob (AND X Y) A)

;; Add knob 'B' to the expression '(OR P Q)'
!(add-knob (OR P Q) B)

;; Add knob 'K' to the expression 'A' (where 'A' is a Symbol -> BoolExpr variable)
!(add-knob A K)
