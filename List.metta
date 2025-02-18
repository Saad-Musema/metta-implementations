(: List Type)
(: Nil List)
(: Cons (-> Number List List))



; (= (length Nil) 0)
; (= (length (Cons $x $xs)) (+ 1 length $xs))

; ; !(length (myList))

(= (length ()) 0)
(= (length (:: $x $xs)) (+ 1 (length $xs)))
!(length (:: 1(:: 2 ())))


(= (is-member ()) False)

(= (is-member (:: $x $xs) $y) (
    if(== $x $y) (True) (is-member $xs $y)

)

)

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




; !(is-member Cons 1 (Cons 2 (Cons 3 (Cons 4 (Nil)))) 5)

!(is-member (:: 1(:: 2 ())) 3)