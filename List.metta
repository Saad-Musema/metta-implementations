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
(= (is-member ()) ())
(= (is-member (:: $x $xs) $y) (
    if(== $x $y) (True) (is-member $xs $y)
)
)

(: is_member (-> Number List Bool))
(= (is_member $y Nil) False)
(= (is_member $y (Cons $x $xs))
    (if (== $y $x)
        True
    (is_member $y $xs))
)

!(Is-Member Implementation)
!(is-member (:: 1(:: 2 ())) 3)

; !(is-member Cons 1 (Cons 2 (Cons 3 (Cons 4 (Nil)))) 5)

; Mapping Function
(: map (-> (-> Number Number) List List))
(= (map $func Nil) Nil)
(= (map $func (Cons $x $xs))
    (Cons ($func $x) (map $func $xs))
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


(= (remove2 $x $pattern)
     ()

)

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



(=(less-than $x) (if(< $x 10) ($x) (empty)))

!(Lesser Output)
!(less-than 16)



;Filtering a List
(=(filter $func ()) ())
(=(filter $func (:: $x $xs)) 
(
    if(== (get-type ($func $x)) Number) (Hello)
     (Hey))
)

!(get-type 6)
; :: $x (filter $func $xs)
; filter $func $xs

!(Filtering Output)

!(filter less-than (:: 1(:: 22 ())))

!(End of Filtering)


;;Max -Value

(=(max ()) 0)
(=(max (:: $x $xs)) 
(if (> max $x))
)


(= (max-value $max ()) $max)
(= (max-value $max (:: $x $xs))
    (if (> $max $x)
        (max-value $max $xs)
        (max-value $x $xs)
    )
)

!(Maximum Value)
! (max-value 0 (:: 1 (:: 2 (:: 5 (:: 3 ())))))


(= (min-value $min ()) $min)
(= (min-value $min (:: $x $xs))
    (if (< $min $x)
        (min-value $min $xs)
        (min-value $x $xs)
    )
)

!(Minimum Value)
! (min-value 30 (:: 1 (:: 2 (:: 5 (:: 3 ())))))


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




(: filter (-> (-> Number Bool) List List))
(= (filter $func Nil) Nil)
(= (filter $func (Cons $x $xs))
    (if ($func $x)
        (Cons $x (filter $func $xs))
        (filter $func $xs)
    )
)




