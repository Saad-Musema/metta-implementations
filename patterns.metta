(Female Pam)
(Male Tom)
(Male Bob)
(Male Nejib)
(Female Liz)
(Female Pat)
(Female Ann)
(Male Jim)
(Parent Musema Nejib)
(Parent Musema Tom)
(Parent Tom Bob)
;(Parent Pam Bob)
(Parent Tom Liz)
(Parent Bob Ann)
(Parent Bob Pat)
(Parent Pat Jim)

(= (get-siblings $x) (match &self (, ())))

(= (get-sister $x)
   (match &self
     (, (Parent $y $x)
        (Parent $y $z)
        (Female $z))
     $z
   )
)

(= (get-sister $x)
   (match &self
     (, (Parent $y $x)
        (Parent $y $z))
     $z
   )
)
!(Mercy Output)
! (get-sister Bob)
!(ENd)

; ( = (get-brother $x) (match &self (, (get-siblings $x))))
(= (get-brother $x)
( let* (
    ($siblings (get-siblings $x))
)
    $siblings
)
)
!(new output)
!(get-brother Nejib)
!(ends)

   match &self(
    ,(Parent $y $x)
     (Parent $y $z)
     (Male $z))
     $z

!(get-brother Nejib)

(= (get-uncle $x)
(match &self(
    ,(Parent $y $x)
    
)
    $z
)

)

!(get-uncle Bob)

(= (get-parents $x)
(match &self(Parent $y $x) $y)
)

(= (get-grand-parent $x)
    (get-parents (get-parents $x))
)

!(get-grand-parent Bob)



!(get-parents Bob)




! (get-brother Liz)