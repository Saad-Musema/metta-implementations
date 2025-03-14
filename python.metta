! ((py-atom numpy.absolute) -5) ; 5
! (bind! abs (py-atom numpy.absolute (-> Number Number)))
! (+ (abs -5) 10) ; 15