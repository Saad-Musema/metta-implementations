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

(= (get-sister $x)
   (match &self
     (, (Parent $y $x)
        (Parent $y $z)
        (Female $z))
     $z
   )
)
! (get-sister Bob)


(= (get-brother $x)
(match &self(
    ,(Parent $y $x)
     (Parent $y $z)
     (Male $z))
     $z
)
)

!(get-brother Nejib)

(= (get-uncle $x)

    (get-brother (get-parent $x))

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