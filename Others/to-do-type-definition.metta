; Type Constructor and Data Constructor
(: Node (-> $a Type) )
(: mkNode (-> $a (Node $a)))

;!(get-type(mkNode 3))


(: List (-> $a Type))
!(get-type(List 4)) ; List 4

(: Nil (List $a))
!(get-type Nil)

(: Cons ( -> $a (List $a) (List $a)))
!(get-type (Cons 4 Nil))

;;;;--------- Tree---------

(: Tree (-> $a Type))
!(get-type (Tree 4))

;mkTree is a constructor that builds a Tree of type $a using:
(: mkTree (-> (Node $a) (List (Tree $a)) (Tree $a)))

(: A Bool)

;; construct a tree with node A

