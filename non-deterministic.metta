; Implement findAndReplace, findAndRemove, isMember, and a non-deterministic permutation function that generates all possible orders of a given set of numbers. Ensure that the number of possible permutations is checked beforehand to avoid combinatorial explosion.
; - Develop a path-finding function that determines a route between two points in a MeTTa graph.
; - Create recursive functions: repeat, zip, zipWith, and generate.

; Find and Remove

(=(remove $val $atom) (collapse (let $a (superpose $atom) (if (== $val $a) (empty) $a))))

!(remove 5 (1 2 3 4 5))

; Find and Replace

(=(replace $val $new $atom) (collapse (let $a (superpose $atom) (if (== $val $a) $new $a))))

!(replace 5 8 (1 2 3 4 5))


; is-member

(=(member $val $atom) (collapse (let $a (superpose $atom) (if (== $val $a) True (empty)))))

!(member 5 (1 2 3 4 5))


; Recursive Functions

; Repeat

(=(repeat $x 5) ($x $x))


; Zip

(= (zip $list1 $list2)
    (case ($list1 $list2)
        (((() ()) ())
            (((:: $x $xs) (:: $y $ys)) (:: ($x $y) (zip $xs $ys)))
            ($else (empty))
            )
        )
)

(=(new-zip (Nil) (Nil)) (empty))
(=(new-zip (Cons $x $xs) (Cons $y $ys)) (
    if (== $x Nil) (empty)
    ((Cons ($x $y) (new-zip $xs $ys)))
))

!(Newzip output)
!(new-zip (Cons 1 (Cons 2 (Cons 3 Nil))) (Cons 1 (Cons 2 (Cons 3 Nil))))


! (zip (:: A (:: B ())) (:: 1 (:: 2 ())))
! (zip (:: A (:: B ())) (:: 1 ())) 

;Zip with
(= (zip-with $x $list1 $list2)
    (case ($list1 $list2)
        (((() ()) ())
            (((:: $x $xs) (:: $y $ys)) (:: ($x $y) (zip $xs $ys)))
            ($else (empty))
            )
        )
)


;generate


(= (append () $y) $y)
(= (append (Cons $x $xs) $y) (Cons $x (append $xs $y)))
; !(append (Cons A (Cons B (Cons C Nil))) (Cons D Nil))

(= (reverse ()) ())
(= (reverse (Cons $x $xs))
   (append (reverse $xs) (Cons $x ())))


(=(generate $x) (
   if (== $x 0) ()
    (Cons $x (generate (- $x 1)))
))

(= (generate-list $x)
   (reverse (generate $x)))
   

!(Generate list Output)
!(generate-list 5)



;permutation function
