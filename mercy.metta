(= (isEven $x) (== (% $x 2) 0))
(= (pickEven $x) (if (isEven $x) $x (empty)))

!(collapse (pickEven 10))
!(collapse (pickEven (superpose (1 2 3 4 5))))




!(let*
    (
    ;   ($a (superpose (A B C D E)))
    ;   ($a (superpose (A)))
      (($a $b) (superpose ((A C) (E A) (F A) (G A) (G A) (I H))))
    )
    ($a $b))

(= (double $x) (* 2 $x))

(= (nDMap $f $atom) (collapse ($f (superpose $atom))))
!(nDMap double (1 2 3 4 5))

;; filter
(= (filter $p $atom) (collapse (let $a (superpose $atom) (if ($p $a) $a (empty)))))
!(filter isEven (1 2 3 4 5))

(= (is-member $p $atom) (collapse (let $a (superpose $atom) (if ($p $a) $a (empty)))))

(=(remove $val $atom) (collapse (let $a (superpose $atom) (if (== $val $a) (empty) $a))))

!(remove 5 (1 2 3 4 5))

(=(replace $val $new $atom) (collapse (let $a (superpose $atom) (if (== $val $a) $new $a))))


(=(member $val $atom) (collapse (let $a (superpose $atom) (if (== $val $a) True (empty)))))

!(member 5 (1 2 3 4 5))


(= (append () $y) $y)
(= (append (Cons $x $xs) $y) (Cons $x (append $xs $y)))
; !(append (Cons A (Cons B (Cons C Nil))) (Cons D Nil))

(= (reverse ()) ())
(= (reverse (Cons $x $xs))
   (append (reverse $xs) (Cons $x ())))


(=(replace $val $new $atom) (let* ($values (collapse (let $a (superpose $atom) (if (== $val $a) $new $a)))) $values))

!(replace 5 8 (1 2 3 4 5))