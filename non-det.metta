(= (bin) 0)
(= (bin) 1)
(= (bin2) (superpose (0 1)))
; ! (bin) ; [0, 1]
! (bin2) ; [0, 1]
! (bin2)


! (+ 2 (superpose (3 9 5))) ; [5, 6, 7]
! (+ 2 ( 8 9 10))

(= (ikb) international-klein-blue)
(= (color) green)
(= (color) yellow)
(= (color) (ikb))

!(assertEqual
  (match &self (= (color) $x) $x)
  (superpose ((ikb) yellow green))) ; ()
!(assertEqualToResult
   (match &self (= (color) $x) $x)
  ((ikb) yellow green)) ; Error