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



!(is-member Cons 1 (Cons 2 (Cons 3 (Cons 4 (Nil)))) 5)

!(is-member (:: 1(:: 2 ())) 3)

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

; ! (remove 2 (:: 1 (:: 2 (:: 5 (:: 3 ())))))


(=(less-than $x) (if(< $x 0)($x) ()))

;Filtering a List
(=(filter (:: $x $xs) $f) (
    $f (:: $x $xs)
))

!(filter (:: 1(:: 2 ())) less-than)



