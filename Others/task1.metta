(: Tree (-> $a Type))
(: List (-> $a Type))
(: Node (-> $a Type))
(: mkNode (-> $a (Node $a)))
(: Nil (List $a))
(: mkTree (-> (Node $a) (List (Tree $a)) (Tree $a)))
(: nodeConstructor (-> Atom (Tree $a)))
(: ex2L (-> Expression (List $a)))
(: exp2Tree (-> $t (Tree $a)))
;;;; the below map type signature have a mistake, and it fixed througth the subsequent signature
;(: map (-> (-> $a (Tree $a)) Expression))
(: map (-> (-> $a (Tree $a)) Expression Expression))




; This creates an tree with no children, a tree with a single root

(= (nodeConstructor $t)
  (mkTree (mkNode $t) Nil))


(= (ex2L $exp)
  (if (== $exp ())
    Nil
    (let* ((($f $t) (decons-atom $exp))
           ($c (ex2L $t)))

      (Cons $f $c))))

(= (map $ctor $exp)
  (if (== $exp ())
    $exp
    (let*
      ((($f $t) (decons-atom $exp))
      ($c (map $ctor $t)))
       
      (if (== (get-metatype $f) Expression)
        (let $head (exp2Tree $f)
          (cons-atom $head $c)
        )
        (let $h ($ctor $f)
          (cons-atom $h $c)
        )))))


(= (exp2Tree $expr) 
    (if (not (== (get-metatype $expr) Expression))
        (mkTree (mkNode $expr) Nil)
        (let* 
            ((($f $t) (decons-atom $expr))
               ($tail (map nodeConstructor $t)))

            (mkTree (mkNode $f) (ex2L $tail))
        )

    )

)



!(exp2Tree (A B (C D E)))



