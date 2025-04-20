;; --- Node Definition ---
(: Node (-> $a Type) )
(: mkNode (-> $a (Node $a)))

;; --- List Definition ---
(: List (-> $a Type))
(: Nil (List $a))
(: Cons ( -> $a (List $a) (List $a)))

;; --- Tree Definition ---
(: Tree (-> $a Type))
(: mkTree (-> (Node $a) (List (Tree $a)) (Tree $a)))

;; the above all is related to Tree, node, and List  structure definitions


;; The below all is related with Knob defitnition from dev branch of moses-metta repository

(: NodeId Type)
(: mkNodeId (-> $tuple NodeId))

;; Knob base representation 
; Tree: a tree reference (The exemplar)
; NodeId: a position poininting to current position in the tree

(: knob Type)
(: mkKnob (-> (Tree $a) NodeId knob))

;;; Discrete knob representation
; Multiplicity: number of possible distinct settings a given knob can have
; DiscSpec: Disc specification contatining the states

(: DiscreteKnob Type)
(: Multiplicity Type)
(: mkMultip (-> Number Multiplicity))
(: DiscSpec Type)
(:mkDiscSpec (-> Number DiscSpec))


;; DiscreteKnob
(: mkDiscKnob (-> knob Multiplicity DiscreteKnob))
(: mkDiscKnob (-> knob Multiplicity DiscSpec DiscSpec (List DiscSpec) DiscreteKnob))


(= (mkDiscKnob $knob $multiplicity)
    (mkDiscKnob $knob $multiplicity (mkDiscSpec 0) (mkDiscSpec 0) Nil)
)


