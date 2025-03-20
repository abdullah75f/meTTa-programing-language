# Task-1:  Write the following functions: get-mother, get-sisters, get-siblings, get-grandparents, get-grandfather, get-grandmother, get-uncles, get-aunts, get-nieces, get-nephews and get-nth-predecessors $person $n . 
from hyperon import MeTTa
metta= MeTTa()

metta_code = '''
; Insert knowledge into the MeTTa Knowledge Graph (Atomspace)
(Male Abebe)
(Female Abebech)
(Male Kebede)
(Female kebedech)
(Male Eyob)
(Female Betty)
(Parent Abebe Eyob)
(Parent Abebech Eyob)
(Parent Abebe Betty)
(Parent Abebech Betty)
(Parent Kebede Abebe)
(Parent kebedech Abebech)

; get-mother Function
(= (get-mother $y $x) (match &self (,
                                (Parent $y $x)
                                (Female $y)
                                 )
                                 $y
                                 ))
!(get-mother $x Betty )

; get-sister Function
(= (get-sisters $x) (match &self (,
                                 (Parent $y $x)
                                 (Parent $y $z)
                                 (Female $z)
                                 )
                                 $z
                                 ))

!(get-sisters Betty)

; get-siblings Function
(= (get-siblings $x) (match &self (,
                                (Parent $y $x)
                                (Parent $y $z)
                                )
                                $z
                                ))
!(get-siblings Betty)


; get-parents Function
(= (get-parents $y $x) (match &self (Parent $y $x) $y))
!(get-parents $x Eyob)

; get-father Function
(= (get-father $y $x) (match &self (,
                                    (Parent $y $x)
                                    (Male $y)
                                    ) 
                                    $y
                                    ))

!(get-father $x Eyob)

; get-grandparents Function
(= (get-grandparents $z $x) (get-parents $z (get-parents $y $x)))
!(get-grandparents $x Eyob)

; get-grandfather Function
(= (get-grandfather $z $x) (get-father $z (get-father $y $x)))
!(get-grandfather $x Eyob)

; get-grandfather Function
(= (get-grandmother $z $x) (get-mother $z (get-mother $y $x)))
!(get-grandmother $x Eyob)

 (= (get-nth-predecessors $person $n) )

 '''

result = metta.run(metta_code)
print(result)