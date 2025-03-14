(= (age Bob) 5)
(= (age Saad) 5)
(= (age Sam) 8)
(= (age Ann) 3)
(= (age Tom) 5)
(= (of-same-age $who)
   (let $age (age $who)
        (match &self (= (age $other) $age)
               $other)))

! (let $age (age Bob)
       (match &self (= (age $other) $age)
              $other))


(Parent Bob Ann)
(Parent Pam Ann)
! (assertEqualToResult
    (match &self (Parent $x Ann) $x)
    (Bob Pam))  ; ()


; (= (bin) 0)
; (= (bin) 1)
; ! (assertEqualToResult (bin) (0 1)) ; ()
; ! (assertEqualToResult (+ 1 2) (3)) ; ()
; ! (assertEqualToResult
;     (+ 1 untyped-symbol)
;    ((+ 1 untyped-symbol))) ; ()
; ! (assertEqualToResult (+ 1 2) ((+ 1 2))) ; Error
