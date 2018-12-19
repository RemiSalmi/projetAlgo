public struct pioche : piocheProtocol {

    var archer : Int
    var soldat : Int
    var garde : Int

  // init : -> Pioche
  // création d’une pioche, initialisée avec 9 Soldats, 6 Gardes et 5 Archers
  //la pile pioche est vide
  init(){
    self.archer = 5
    self.soldat = 9
    self.garde = 6
  }

  // piocheVide : Pioche-> Bool
  // Vrai si piocheVide Faux sinon
  //si on ne peut plus créer de carte
  func piocheVide()->Bool{
    return self.taillePioche() == 0
  }

  // taillePioche : Pioche -> Int
  // nombre de carte présentes dans la pioche
  //nombre de carte que l'on peut créer
  // si la pioche est vide renvoyer 0
  // qu&& nbArcherPioche()==nbArchers() ou
  // qu&& nbSoldatPioche()==nbSoldats() ou
  // qu&& nbGuerrierPioche()==nbGuerriers()
  func taillePioche()->Int{
    return self.nbArchers() + self.nbSoldats() + self.nbGardes()
  }

  // nbArcher : Pioche -> Int
  // nombre total de carte archer que l'on peut créer
   func nbArchers()->Int{
     return self.archer
   }


  // nbSoldat : Pioche -> Int
  // nombre total de carte soldat que l'on peut créer
  func nbSoldats()->Int{
    return self.soldat
  }

  // nbGarde : Pioche -> Int
  // nombre total de carte garde que l'on peut créer
  func nbGardes()->Int{
    return self.garde
  }

  // nbArcherPioche : Pioche -> Int
  // nombre de carte archer déjà piochés
  func nbArcherPioche()->Int{
    return 5 - self.nbArchers()
  }

  // nbSoldatPioche : Pioche -> Int
  // nombre de carte soldat déjà piochés
  func nbSoldatPioche()->Int{
    return 9 - self.nbSoldats()
  }

  // nbGardePioche : Pioche -> Int
  // nombre de carte garde déjà piochés
  func nbGardePioche()->Int{
    return 6 - self.nbGardes()
  }


  // piocher : Pioche -> carte?
  // prend une carte sur le dessus de la pioche
  // Pre : la pioche n'est pas vide
  // Post : si la precondition n'est pas respectée renvoyer vide
  // Note 1 : piocher revient à créer une nouvelle carte dont on choisit le type aléatoirement
  //          en fonction du nombre de chaque type restant
  // penser à incrementer le nombre de carte piochées en fonction du type
  @discardableResult
  mutating func piocher()->carte?{
    if (self.piocheVide()){
      return nil
    }else{
      var type : Int

      if (self.nbArchers() == 0){
        type = Int.random(in: 1 ... 2)
      }

      if (self.nbGardes() == 0){
        type = Int.random(in: 0 ... 1)
      }

      if (self.nbSoldats() == 0){
        type = Int.random(in: 0 ... 1)
        if type == 1{
          type = 2
        }
      }

      if (self.nbArchers() == 0 && self.nbSoldats() == 0){
        type = 2
      }

      if (self.nbArchers() == 0 && self.nbGardes() == 0){
        type = 1
      }

      if (self.nbGardes() == 0 && self.nbSoldats() == 0){
        type = 0
      }

      switch type {
      case 0 :
        self.archer = self.archer - 1
        return carte(type : "archer" )
      case 1 :
        self.soldat = self.soldat - 1
        return carte(type : "soldat" )
      case 2 :
        self.garde = self.garde - 1
        return carte(type : "garde" )
      default :
        break;
      }
    }
  }
}
