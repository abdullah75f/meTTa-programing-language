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

;; the above all is related to Tree structure definitions

(: NodeId Type)
(: mkNodeId (-> Number NodeId))


;; Knob base representation 
; Tree: a tree reference
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

;(: mkDiscKnob (-> knob Multiplicity DiscreteKnob))
(: mkDiscKnob (-> knob Multiplicity DiscSpec (List DiscSpec) DiscreteKnob))


(= (mkDiscKnob $knob $multiplicity)
    (mkDiscKnob $knob $multiplicity (mkDiscSpec 0) (mkDiscSpec 0) Nil)
)

(= (addNodeAndKnob $tree $nodeId $newValue)
   (case $nodeId
     (((mkNodeId 0)
       (let $newTree
            (mkTree
                (mkNode AND)
                (Cons
                    (mkTree (mkNode $newValue) Nil)
                    (Cons (mkTree (mkNode A) Nil) (Cons (mkTree (mkNode B) Nil) (Cons (mkTree (mkNode OR) (Cons (mkTree (mkNode A) Nil) Nil)) Nil)))))
            (mkDiscKnob
                (mkKnob $newTree (mkNodeId 1))
                (mkMultip 2)
                (mkDiscSpec 0)
                (Cons (mkDiscSpec 0) (Cons (mkDiscSpec 1) Nil)))))
      ((mkNodeId 3)
       (let $newTree
            (mkTree
                (mkNode AND)
                (Cons
                    (mkTree (mkNode A) Nil)
                    (Cons
                        (mkTree (mkNode B) Nil)
                        (Cons
                            (mkTree
                                (mkNode OR)
                                (Cons (mkTree (mkNode A) Nil) (Cons (mkTree (mkNode $newValue) Nil) Nil)))
                            Nil))))
            (mkDiscKnob
                (mkKnob $newTree (mkNodeId 5))
                (mkMultip 2)
                (mkDiscSpec 0)
                (Cons (mkDiscSpec 0) (Cons (mkDiscSpec 1) Nil)))))
      ($default (Error "Unsupported NodeId")))))


;;=============================================
;; Example Instantiation using the 4-Argument Constructor
;; ==============================================



;; Add New Node C as Child of OR (NodeId 3)
! (addNodeAndKnob
    (mkTree (mkNode AND) (Cons (mkTree (mkNode A) Nil) (Cons (mkTree (mkNode B) Nil) (Cons (mkTree (mkNode OR) (Cons (mkTree (mkNode A) Nil) Nil)) Nil))))
    (mkNodeId 3)
    C)


;; Add New Node C as Child of AND (NodeId 0)
! (addNodeAndKnob
    (mkTree (mkNode AND) (Cons (mkTree (mkNode A) Nil) (Cons (mkTree (mkNode B) Nil) (Cons (mkTree (mkNode OR) (Cons (mkTree (mkNode A) Nil) Nil)) Nil))))
    (mkNodeId 0)
    C)