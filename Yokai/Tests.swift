// Tests pour Joueur.swift


  func TestinitJoueur()->Bool
    res : Bool = true
     j : Joueur = Joueur(2)
     if j.id != 2 or j.tailleMain() !=4 ou !j.estEnReserve() {
         res = false
       }
       return res
     }

  func TestmainEstVide()->Bool{
    res : Bool = true
    j : Joueur = Joueur(2)
    if j.mainEstVide != False{
      res = false
    }
    return res
  }


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


  func TestestEnReserve()->Bool{
    res : Bool =true
    j : Joueur = Joueur(2)
    p : Position = Position(2,1)
    y : Yokai = Yokai("Kodoma",p,1)
    j.ajoutReserve(y)
    if !j.estEnReserve(y) {
        res = false
    }
    return res
  }


func TestajoutMain()->Bool{
  res : Bool = false
  j : Joueur = Joueur(2)
  p : Position = Position(2,2)
  y : Yokai("Kodoma",p,2)

  if j.estEnMain(y) == false{
    j.ajoutMain(y)
    if j.estEnMain(y) {
        res = true
    }
  }
return res
}

   func TestenleverMain()->Bool{
     res : Bool = true
     j : Joueur = Joueur(2)
     p : Position = Position(2,2)
     y : Yokai("Kodoma",p,1)
     j.ajoutMain(y)
     j.enleverMain(y)
     if j.estEnMain(y) {
         res = false
     }
     return res
   }


//Tests Yokai.swift


  func TestgetPosition()->Bool{
    res : Bool = true
    p : Position = Position(2,2)
    y : Yokai = Yokai("Kodoma",p,1)
    if y.getPosition() != p{
      res = false
    }
    return res
  }


 func Testest_KodamaLocked()->Bool{
   res : Bool = true
   p : Position = Position(2,2)
   y : Yokai = Yokai("KodomaLocked",p,1)
   if y.est_KodamaLocked !=true{
     res = false
   }
   return res

 }

//Tests Position.swift



func Testget_CoordX()-> Bool{
  p : Position= Position (1,2)
  return p.get_CoordX() == 1
}

func Testget_CoordY()-> Bool{
  p : Position = Position (1,2)
  return p.get_CoordX() == 2
}

func Testest_Occupe()->Bool{
  res  : Bool= true
  p: Position  = Position(1,2)
  if p.est_Occupe() != false{
    res = false
  }
  return res

}

func TestchangeX()-> Bool{
  res : Bool = true
  p : Position = Position(1,2)
  p.changeX(3)
  if p.get_CoordX() != 3 {
      res = false
  }
  return res

}


func TestchangeY()-> Bool{
  res : Bool = true
  p : Position = Position(1,2)
  p.changeY(3)
  if p.get_CoordY() != 3 {
      res = false
  }
  return res
}

func Testoccuper()-> Bool{
  res : Bool = true
  p : Position = Position(1,2)
  p.occupe()
  if p.est_Occupe() == false {
      res = false
  }
  return res
}

func Testliberer()-> Bool{
  res : Bool = true
  p : Position = Position(1,2)
  p.occupe()
  p.liberer()
  if p.est_Occupe() == true {
      res = false
  }
  return res
}
