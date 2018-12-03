// Tests pour Joueur.swift


  func TestinitJoueur()->Bool

  func TestgetMain()->Bool

  func TestmainEstVide()->Bool{
    res : Bool = true
    j : Joueur = Joueur(2)
    if j.mainEstVide != False{
      res = false
    }
    return res
  }

  func TestgetReserve()->Bool


  func TestreserveEstVide()->Bool{
    res : Bool = true
    j : Joueur = Joueur(2)
    if j.reserveEstVide() == False{
      res = false
    }
    return res
  }


   func TestajoutReserve()->Bool{
     res : Bool = true
     j : Joueur = Joueur(2)
     p : Position = Position(2,1)
     y : Yokai = Yokai("Kodoma",p,1)
     j.ajoutReserve(y)
     if !j.estEnReserve(y) {
         res = false
     }
     return res
   }

   func TestenleverReserve()->Bool{
     res : Bool = true
     j : Joueur = Joueur(2)
     p : Position = Position(2,1)
     y : Yokai = Yokai("Kodoma",p,1)
     j.ajoutReserve(y)
     j.enleverReserve(y)
     if j.estEnReserve(y) {
         res = false
     }
     return res
   }


  func TestestEnReserve()->Bool

  func TestestEnMain()->Bool

 func Testparachuter()-> Bool

 func Testmanger()->Bool

func TestajoutMain()->Bool

   func TestenleverMain()->Bool

//Tests jeu.swift

  func TestinitJeu()->Bool

  func TestgetJoueur()->Bool

  func TestgetJoueurSuivant()->Bool

  func TestmakeItPlateau()->Bool



//Tests Yokai.swift

  func TestinitYokai()->Bool

  func TestgetPosition()->Bool?

 func Testest_KodamaLocked()->Bool

 func TestsetSamourai()->Bool

 func Testdeplacer()->Bool

 func TestdeplacerReserve()->Bool

  func TestpeutAller()->Bool

  func TestmakeItDeplacement()->Bool

//Tests Position.swift

func TestinitPosition()

func Testget_CoordX()-> Bool{
  p = Position (1,2)
  return get_CoordX(p) == 1
}

func Testget_CoordY()-> Bool{
  p = Position (1,2)
  return get_CoordX(p) == 2
}

func Testest_Occupe()->Bool{

}

func TestchangeX()-> Bool

func TestchangeY()-> Bool

func Testoccuper()-> Bool

func Testliberer()-> Bool

func TestsetPosition()-> Bool
