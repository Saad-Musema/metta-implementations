(AddisAbaba 100 Adama)
(AddisAbaba 275 Hawassa)
(AddisAbaba 565 BahirDar)
(AddisAbaba 25 Mojo)
(Mojo 450 DireDawa)
(Adama 350 DireDawa)
(DireDawa 75 Harar)
(Harar 480 Dessie)
(Dessie 380 Mekelle)
(Mekelle 440 Gonder)


!(let*
    (
      (($a $b) (superpose ((AddisAbaba Adama) (AddisAbaba Mojo) (Mojo DireDawa) (Adama AddisAbaba) (Adama BahirDar) (BahirDar AddisAbaba) (DireDawa AddisAbaba) (Adama DireDawa) (Ambo Mekelle) (Gonder Hawassa))))
      (($b $c) (superpose ((AddisAbaba Adama) (AddisAbaba Mojo) (Mojo DireDawa) (Adama AddisAbaba) (Adama BahirDar) (BahirDar AddisAbaba) (DireDawa AddisAbaba) (Adama DireDawa) (Ambo Mekelle) (Gonder Hawassa))))
      (($c $a) (superpose ((AddisAbaba Adama) (AddisAbaba Mojo) (Mojo DireDawa) (Adama AddisAbaba) (Adama BahirDar) (BahirDar AddisAbaba) (DireDawa AddisAbaba) (Adama DireDawa) (Ambo Mekelle) (Gonder Hawassa))))


    )
    (add-atom &self ($a $b $c))
)


(=(finder $x $z) (match &self ($x $y $z) (The path is from $x to $y to $z)))

!(finder AddisAbaba DireDawa)