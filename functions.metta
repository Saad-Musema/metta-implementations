(: List Type)
(: Nil List)
(: Cons (-> Number List List))


(: MyList (-> List))

(= (MyList) (Cons 1(Cons 2(Cons 3(Cons 4 Nil)))))


(: length (-> List Number))

(= (length Nil) 0)
(= (length (Cons $x $xs)) (+ 1 (length $xs)))

!(length (MyList))

(: sum (-> List Number))

(= (sum Nil) 0)
(= (sum (Cons $x $xs)) (+ $x (sum $xs)))

!(sum (MyList))

(: map (-> (-> Number Number) List List))

(= (map $f Nil) Nil)
(= (map $f (Cons $x $xs)) (Cons ($f $x) (map $f $xs)))

(: double (-> Number Number))



(= (double $x) (* 2 $x))


(:doubleList (-> List List))

(=(doubleList $xs) (map double $xs))

!(doubleList(MyList))

(:append (-> List Number List))

(=(append () $x) Cons $x Nil)

!(append () 8)