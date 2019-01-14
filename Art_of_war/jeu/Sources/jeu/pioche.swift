public class pioche : piocheProtocol {
  public typealias Carte = carte
  public typealias Pioche = pioche
  var archer : Int
  var soldat : Int
  var garde : Int

  // init : -> Pioche
  // création d’une pioche, initialisée avec 9 Soldats, 6 Gardes et 5 Archers
  //la pile pioche est vide
  public required init(){
    self.archer = 5
    self.soldat = 9
    self.garde = 6
  }

  // piocheVide : Pioche-> Bool
  // Vrai si piocheVide Faux sinon
  //si on ne peut plus créer de carte
  public func piocheVide()->Bool{
    return self.taillePioche() == 0
  }

  // taillePioche : Pioche -> Int
  // nombre de carte présentes dans la pioche
  //nombre de carte que l'on peut créer
  // si la pioche est vide renvoyer 0
  // qu&& nbArcherPioche()==nbArchers() ou
  // qu&& nbSoldatPioche()==nbSoldats() ou
  // qu&& nbGuerrierPioche()==nbGuerriers()
  public func taillePioche()->Int{
    return self.nbArchers() + self.nbSoldats() + self.nbGardes()
  }

  // nbArcher : Pioche -> Int
  // nombre total de carte archer que l'on peut créer
  public func nbArchers()->Int{
    return self.archer
  }


  // nbSoldat : Pioche -> Int
  // nombre total de carte soldat que l'on peut créer
  public func nbSoldats()->Int{
    return self.soldat
  }

  // nbGarde : Pioche -> Int
  // nombre total de carte garde que l'on peut créer
  public func nbGardes()->Int{
    return self.garde
  }

  // nbArcherPioche : Pioche -> Int
  // nombre de carte archer déjà piochés
  public func nbArcherPioche()->Int{
    return 5 - self.nbArchers()
  }

  // nbSoldatPioche : Pioche -> Int
  // nombre de carte soldat déjà piochés
  public func nbSoldatPioche()->Int{
    return 9 - self.nbSoldats()
  }

  // nbGardePioche : Pioche -> Int
  // nombre de carte garde déjà piochés
  public func nbGardePioche()->Int{
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
  public func piocher()->Carte?{
    if (self.piocheVide()){ //Si la pioche est vide on ne renvoie rien
      return nil
    }else{
      //type 0 = archer
      //type 1 = Soldat
      //type 2 = garde
      var type : Int = -1

      if (self.nbArchers() > 0 && self.nbSoldats() > 0 && self.nbGardes() > 0){//Si toutes les types de carte sont disponibles dans la pioche alors on génère un type aléatoire entre 0 et 2
        type = Int.random(in: 0 ... 2)
      }

      if (self.nbArchers() == 0){ //Si il n'y a pas d'archers dans la pioche alors on génère un chiffre aléatoire entre 1 et 2 seulement
        type = Int.random(in: 1 ... 2)
      }

      if (self.nbGardes() == 0){ //Si il n'y a pas de garde dans la pioche alors on génère un chiffre aléatoire entre 0 et 1 seulement
        type = Int.random(in: 0 ... 1)
      }

      if (self.nbSoldats() == 0){ //Si il n'y a pas de soldat dans la pioche alors on génère un chiffre aléatoire entre 0 et 1 seulement car il nous faudrait soit le type 0 soit le 2 mais c'est impossible car on peut le faire seulement sur des intervales
        type = Int.random(in: 0 ... 1)
        if type == 1{//Si le chiffre aléatoire est 1 alors on le converti en 2
          type = 2
        }
      }

      if (self.nbArchers() == 0 && self.nbSoldats() == 0){//Si on a pas d'archer n'y de soldat alors on fixe le type à 2
        type = 2
      }

      if (self.nbArchers() == 0 && self.nbGardes() == 0){//Si on a pas d'archer n'y de garde alors on fixe le type à 1
        type = 1
      }

      if (self.nbGardes() == 0 && self.nbSoldats() == 0){//Si on a pas de garde n'y de soldat alors on fixe le type à 0
        type = 0
      }


      if(type == 0){ //Si le type est 0 on décrémente le nombre d'archer dispo dans la pioche et on renvoie une carte archer
        self.archer = self.archer - 1
        return carte(type : "archer" )
      }else{

      }
      if(type == 1){//Si le type est 1 on décrémente le nombre de soldat dispo dans la pioche et on renvoie une carte soldat
        self.soldat = self.soldat - 1
        return carte(type : "soldat" )
      }
      if(type == 2){ //Si le type est 2 on décrémente le nombre de garde dispo dans la pioche et on renvoie une carte garde
        self.garde = self.garde - 1
        return carte(type : "garde" )
      }
      return nil //Si erreur
    }
  }
}
