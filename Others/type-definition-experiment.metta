; Type Constructor and Data Constructor
(: Node (-> $a Type) )
(: mkNode (-> $a (Node $a)))

!(get-type(mkNode 3))


(: List (-> $a Type))
;!(get-type(List 4)) ; List 4

(: Nil (List $a))
!(get-type Nil)

(: Cons ( -> $a (List $a) (List $a)))
;!(get-type (Cons 4 Nil))

;;;;--------- Tree---------

(: Tree (-> $a Type))
;!(get-type (Tree 4))

;mkTree is a constructor that builds a Tree of type $a using:
(: mkTree (-> (Node $a) (List (Tree $a)) (Tree $a)))

(: A Bool)

;; -----construct a tree with node A-----

!(get-type(mkTree (mkNode A) Nil))

;;; -----construct a tree with (AND A)-----

!(get-type (mkTree (mkNode AND) (Cons (mkTree( mkNode A) Nil) Nil)))

;;; -----construct a tree with (AND A B)-----
!( get-type (mkTree (mkNode AND) (Cons (mkTree (mkNode A) Nil) (Cons (mkTree (mkNode B) Nil) Nil))))



;;; -----construct a tree with (AND A B (OR A))-----

!( get-type (mkTree (mkNode AND) (Cons (mkTree (mkNode A) Nil) (Cons (mkTree (mkNode B) Nil) (Cons (mkTree (mkNode OR) (Cons (mkTree (mkNode A) Nil)Nil)) Nill)))))

(1 2 3) -> (Cons 1 (Cons 2 (Cons 3 Nil)))
(Cons 1 Nil) -> (1)


;;; -----list to Expression Defintion-----

(:listToExpression (-> (List $a) Expression))

(= (listToExpression Nil) ())

( = (listToExpression (Cons $x $xs)) (
    let $c (listToExpression $xs) (cons-atom $x $c)
))

! (listToExpression (Cons 0 (Cons 1 (Cons 2 Nil))))



(: expressionToList (-> Expression (List $a)))
(= (expressionToList ()) Nil)
(= (expressionToList $expression)
    (
        let* (
            (($head $tail) (decons-atom $expression))
            ($build (expressionToList $tail))
            )
            (Cons $head $build)
    )
   )

! (expressionToList (0 1 3))

