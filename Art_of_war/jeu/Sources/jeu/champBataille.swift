

public struct champBataille : champBatailleProtocol {

  var champ : [Carte?]
  //champ = [A1,A2,A3,F1,F2,F3]

  // init :  -> ChampBataille
  // création d’un ChampBataille vide
  init(){
    self.champ = [Carte?](repeating: nil, count: 6)
  }

  // estVide : champBataille -> Bool
  // Renvoie vrai si le champ de bataille ne contient aucune cartes
 	// Renvoie faux sinon
  func estVide()->Bool{
    return self.caseVide(pos:"A1") && self.caseVide(pos:"A2") && self.caseVide(pos:"A3") && self.caseVide(pos:"F1") && self.caseVide(pos:"F2") && self.caseVide(pos:"F3")

  }

  // caseVide : champBataille x String -> Bool
  // Renvoie vrai si une position du CB est vide
 	// Renvoie faux sinon
  func caseVide(pos:String)->Bool{
    var carte : Carte?
    var reponse : Bool = true
    switch pos{

    case "A1":
      carte = self.champ[0]
    case "A2":
      carte = self.champ[1]
    case "A3":
      carte = self.champ[2]
    case "F1":
      carte = self.champ[3]
    case "F2":
      carte = self.champ[4]
    case "F3":
      carte = self.champ[5]
    default:
      break;
    }

    if let carte = carte{
      reponse = false
    }
    return reponse
  }

  // positionCarte : champBataille x Carte -> String
  // Renvoie la position de la carte sur le champ de bataille
  // renvoie vide si la carte n'est pas présente sur le champ de bataille
  func positionCarte(c:Carte)->String?{
    var id_position : Int = -1
    var position : String? = nil
    var courant : Int = 0
    var iterateurChamp = self.makeIt()
    while let carte = iterateurChamp.next(){
      if c.estDuType() == carte.estDuType(){
        id_position = courant
      }
      courant = courant + 1
    }
    if id_position < 0 {
      switch id_position{
      case 0:
        position = "A1"
      case 1:
        position = "A2"
      case 2:
        position = "A3"
      case 3:
        position = "F1"
      case 4:
        position = "F2"
      case 5:
        position = "F3"
      default:
        break;
      }
    }
    return position
  }

  // CartePosition : champBataille x String -> Carte
  // Renvoie la carte de la position sur le champ de bataille
  // renvoie vide si pas de carte
  func CartePosition(pos:String)->Carte?{
    var carte : Carte?
    var reponse : Bool = true
    switch pos{

    case "A1":
      carte = self.champ[0]
    case "A2":
      carte = self.champ[1]
    case "A3":
      carte = self.champ[2]
    case "F1":
      carte = self.champ[3]
    case "F2":
      carte = self.champ[4]
    case "F3":
      carte = self.champ[5]
    default:
      break;
    }
    return carte
  }

  // peutAttaquer : ChampBataille x Carte x String ->Bool
  // indique si une carte peut attaquer une certaine position du champs de bataille adverse
  // True si peut attaquer False sinon
  //Note developpeurs : C'est le champ de bataille adverse qui est le Self
  func peutAttaquer(c:Carte,pos:String)->Bool{
    return (!self.caseVide(pos: pos)) //Retourne true si la case n'est pas vide
  }


  // placerCarte : ChampBataille x Carte x String ->
  // la fonction verifie si le front est plein met la carte en arriere
  // sinon ajoute au front sur la colonne "pos"
  //Note developpeurs : Pas assez de specifs ici. Quels sont les cas qui engendre des erreurs.
  @discardableResult
  mutating func placerCarte(c:Carte,pos:String){
    var indice : Int = 3
    switch pos{ //On verifie uniquement les positions front, car la position en paramètres est une position front
    case "F1":
      indice = 3
    case "F2":
      indice = 4
    case "F3":
      indice = 5
    default:
      indice = 3
    }

    if self.caseVide(pos: pos){ //Si la position en front est libre
      self.champ[indice] = c
    }
    else{                 //Si elle est pas libre alors on ajoute sur la case arrière
      indice = indice - 3
      self.champ[indice] = c
    }
  }

  // supprimerCarte : ChampBataille x Carte ->
  // supprimer une carte du champ de bataille
  @discardableResult
  mutating func supprimerCarte(c:Carte){
    var position = self.positionCarte(c: c)
    if let position = position {
      switch position{
      case "A1":
        self.champ[0]=nil
      case "A2":
        self.champ[1]=nil
      case "A3":
        self.champ[2]=nil
      case "F1":
        self.champ[3]=nil
      case "F2":
        self.champ[4]=nil
      case "F3":
        self.champ[5]=nil
      default:
        break;
      }
    }
  }


  func makeIt()->IteratorChampBataille{
    return IteratorChampBataille(self)
  }
}

public struct IteratorChampBataille : IteratorProtocol{
  private let champ_bataille : champBataille
  private var courant : Int = 0
  fileprivate init(_ cb: champBataille){
    self.champ_bataille = cb
  }

  //Note developpeurs:
  //Tant que c'est vide :
  //  On verifie si c'est une carte ou vide
  // Si c'est une carte , c'est bon
  // Si c'est vide, on passe au next
  // Si on est a la fin, on retourne nil
  public mutating func next()->Carte?{
    guard self.courant < 6 else { return nil }

    guard let carte = self.champ_bataille.champ[self.courant] else {
      self.courant = self.courant + 1
      return self.next()
    }
    self.courant = self.courant + 1
    return carte
  }
}
