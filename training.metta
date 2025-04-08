;; Introduction
;; Graph Representation
(Male Solomon)
(Male Dawit)
(Male Bereket)

(Female Helen)
(Female Rahel)

(Parent Solomon)
(Parent Helen)

(Child Bereket Solomon)
(Child Rahel Solomon)

(AddisAbaba 100 Adama)
(AddisAbaba 275 Hawassa)
(AddisAbaba 565 BahirDar)
(Adama 350 DireDawa)
(DireDawa 75 Harar)
(Harar 480 Dessie)
(Dessie 380 Mekelle)
(Mekelle 440 Gonder)

;; Pattern Matching

!(match &self (Male $x) $x)
!(match &self (AddisAbaba $w $d) (AddisAbaba to $d is $w Kms))

;; Std lib
;; let
;; let*
;; cons-atom
;; decons-atom
;; if

;; Functional Programming
;; Function Definition

(= (foo $a) $a)
!(foo 1)

(= (isEven $x) (== (% $x 2) 0))
!(isEven 0)
!(isEven 1)
!(isEven 2)

(= (double $x) (* 2 $x))

(= (applyTwice $f $x) ($f ($f $x)))

(= (map $f $list)
   (if (== $list ())
     ()
     (let*
        (
          (($h $t) (decons-atom $list))
          ($h' ($f $h))
          ($t' (map $f $t))
        )
        (cons-atom $h' $t')
     )
   )
)

!(map double (1 2 3 4 5))


;; Non Determinism
;; collapse
!(collapse (match &self (Male $x) $x))
!(collapse (match &self (AddisAbaba $w $d) (AddisAbaba to $d is $w Kms)))

;; superpose
!(superpose (A B C D E))
!((superpose (A B C D E)) (superpose (F G H I J)))

;; empty
!(empty)

(= (pickEven $x) (if (isEven $x) $x (empty)))
!(pickEven 10)
!(pickEven 1)
!(collapse (pickEven 10))
!(collapse (pickEven (superpose (1 2 3 4 5))))

;; Unification with let*
!(let*
    (
      (($a $a) ((superpose (A B C D E)) (superpose (F G H I J A B))))
    )
    ($a $a))

!(let*
    (
      ($a (superpose (A B C D E)))
      ;; ($a (superpose (A)))
      ;; (($a $b) (superpose ((A C) (E A) (F A) (G A) (G A) (I H))))
    )
    ($a $a))

!(let*
    (
      (($a $b) (superpose ((AddisAbaba Adama) (Adama AddisAbaba) (Adama BahirDar) (BahirDar AddisAbaba) (DireDawa AddisAbaba) (Adama DireDawa) (Ambo Mekelle) (Gonder Hawassa))))
      (($b $c) (superpose ((AddisAbaba Adama) (Adama AddisAbaba) (Adama BahirDar) (BahirDar AddisAbaba) (DireDawa AddisAbaba) (Adama DireDawa) (Ambo Mekelle) (Gonder Hawassa))))
      (($c $a) (superpose ((AddisAbaba Adama) (Adama AddisAbaba) (Adama BahirDar) (BahirDar AddisAbaba) (DireDawa AddisAbaba) (Adama DireDawa) (Ambo Mekelle) (Gonder Hawassa))))
    )
    ($a $b $c))

!(let*
    (
      (($a $b) (superpose ((AddisAbaba Adama) (Adama AddisAbaba) (Adama BahirDar) (BahirDar AddisAbaba) (DireDawa AddisAbaba) (Adama DireDawa) (Ambo Mekelle) (Gonder Hawassa))))
      (($b $c) (superpose ((AddisAbaba Adama) (Adama AddisAbaba) (Adama BahirDar) (BahirDar AddisAbaba) (DireDawa AddisAbaba) (Adama DireDawa) (Ambo Mekelle) (Gonder Hawassa))))
      (($c $a) (superpose ((AddisAbaba Adama) (Adama AddisAbaba) (Adama BahirDar) (BahirDar AddisAbaba) (DireDawa AddisAbaba) (Adama DireDawa) (Ambo Mekelle) (Gonder Hawassa))))
    )
    ($a $b $c))

;; Error: getByIndex implementation.
(= (getByIdx Nil $idx) (Error (Index out of range)))
;; (= (getByIdx Nil $idx) Nil)
(= (getByIdx (Cons $head $tail) 0) $head)
(= (getByIdx (Cons $head $tail) $idx) (getByIdx $tail (- $idx 1)))

!(getByIdx (Cons 1 (Cons 2 (Cons 3 Nil))) 1)

;; Examples
;; map
(= (nDMap $f $atom) (collapse ($f (superpose $atom))))
!(nDMap double (1 2 3 4 5))

;; filter
(= (filter $p $atom) (collapse (let $a (superpose $atom) (if ($p $a) $a (empty)))))
!(filter isEven (1 2 3 4 5))

;; findAndReplace
;; findAndRemove
;; isMember
;;
;; repeat
;; zip
;; zipWith
;; generate


;; PathFinding Function

;; permitutation