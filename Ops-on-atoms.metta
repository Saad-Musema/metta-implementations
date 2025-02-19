! (car-atom (Cons X Nil))
! (car-atom (:: 1 (:: 2 ()))) 

(=(calls (:: $x $xs)) 
(car-atom ($x))
)
!(calls (:: 1 (:: 2 ())))
! (cdr-atom (Cons X Nil)) ; (X Nil)
! (car-atom (seg (point 1 1) (point 1 4)))

!(cons-atom Cons (:: 1 ))