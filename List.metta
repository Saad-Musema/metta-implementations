(: List Type)
(: Nil List)
(: Cons (-> Number List List))


; Length using Cons definition
; (= (length Nil) 0)
; (= (length (Cons $x $xs)) (+ 1 length $xs))

; ; !(length (myList))


;Length with :: Definition
(= (length ()) 0)
(= (length (:: $x $xs)) (+ 1 (length $xs)))
!(length (:: 1(:: 2 ())))



;Is-member function
(= (is-member ()) False)
(= (is-member (:: $x $xs) $y) (
    if(== $x $y) (True) (is-member $xs $y)
)
)
!(Is-Member Implementation)
!(is-member (:: 1(:: 2 ())) 3)

; !(is-member Cons 1 (Cons 2 (Cons 3 (Cons 4 (Nil)))) 5)


;;Adds to end of list
(= (append $y Nil) (Cons $y Nil))
(= (append $y (Cons $x $xs))
    (Cons $x (append $y $xs))
)

!(append 5 (Cons 1 Nil))


;;Pushes to top of list
(=(push $y Nil) (Cons $y Nil))
(=(push $y (Cons $x $xs)) (Cons $y (Cons $x $xs)))

!(push 5 (Cons 1()))



; Function to compare two numbers
(=(compare $x $y) (if(> $x $y) ($x) $y))
!(compare 5 7)

(= (max-val ()) ())
(= (max-val (:: $x $xs)) 
(if ())
)


(=(compare-list (:: $x $xs)) (compare $x ))


; Function to remove an Element -- Autogen
(=((= (remove $rm ()) ())

(= (remove $rm (:: $x $xs))
    (if (== $rm $x)
        (remove $rm $xs)
        (:: $x (remove $rm $xs))
    )
)
))

!(Remove Function Output)
! (remove 2 (:: 1 (:: 2 (:: 5 (:: 3 ())))))




; (=(calls (:: $x $xs)) 
; (car-atom ($x))
; )
; !(calls (:: 1 (:: 2 ())))



; (=(remove $y (:: $x $xs)) ( (== (car-atom $x) 1) ))

(= (double $x) (* $x 2))

!(doubling output)
!(double 5)

;Mapping Function
(=(map $func ()) ())
; (=(map $func (:: $x $xs)) ( append( $func ($x)) map $func $xs)) 
(=(map $func (:: $x $xs)) (:: ($func $x) (map $func $xs)))


!(Map List Output)

!(map double (:: 1 (:: 2 (:: 3 ()))))



(=(less-than $x) (if(< $x 10) ($x) ()))

!(Lesser Output)
!(less-than 16)



;Filtering a List
(=(filter $func ()) ())
(=(filter $func (:: $x $xs)) 
(($func $x) (filter $func $xs))
)

!(Filtering Output)

!(filter less-than (:: 1(:: 22 ())))

!(End of Filtering)


;;Max -Value

(=(max ()) 0)
(=(max (:: $x $xs)) 
(max $xs)
)

(= (first-element (:: $x $xs)) $x)
(= (max-value $max ()) $max)
(= (max-value $max (:: $x $xs))
    (if (> $max $x)
        (max-value $max $xs)
        (max-value $x $xs)
    )
)
! (max-value (first-element (:: 1 (:: 2 (:: 5 (:: 3 ()))))) (:: 1 (:: 2 (:: 5 (:: 3 ())))))


;;Pop Function

(=(pop (:: $x $xs)) $xs)

!(pop (:: 1(:: 2 ())))

;Reverse Function

(= (reverse ()) ())
(= (reverse (:: $x $xs))
    (append (reverse $xs) $x))
(= (append () $element) (:: $element ()))
(= (append (:: $x $xs) $element)
    (:: $x (append $xs $element)))

!(reverse (:: 1 (:: 2 (:: 3 (:: 4 ())))))



;Fold R

(=(foldr ()) 0)
(=(foldr (:: $x $xs)) (+ $x (foldr $xs)))


!(foldr (:: 1 (:: 2 (:: 3 (:: 4 ())))))









