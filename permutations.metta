!(let*
    (
      (($a $b) ((superpose (A B)) (superpose (F G))))
    )
    ($a $b))


(=(permutation (Cons $x $xs) (Cons $y $ys) $count) (
    if (> $count 3)
    (Too Complex)
    (
        if (== $count 2)
            ()  
        )
))

(=(permuatate $a $b) (superpose($b $a))) 
(=(permuatate $a $b) (superpose($a $b)))

!permuatate (superpose (5 6))

; !(permutation (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 ()))))) 2)


!(Termany)
!(superpose (A B C D E))
!((superpose (A B C D E)) (superpose (F G H I J)))
