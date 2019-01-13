

public class champBataille : champBatailleProtocol {
  public typealias ChampBataille = champBataille
  public typealias Carte = carte
  //typealias Carte = carte
  var champ : [Carte?] //Notre attribut champ est une tableau de Carte?
  //champ = [A1,A2,A3,F1,F2,F3], cela correspond aux indices [0,1,2,3,4,5]

  // init :  -> ChampBataille
  // création d’un ChampBataille vide
  public required init(){
    self.champ = [Carte?](repeating: nil, count: 6) //Création d'un tableau de Carte? de taille 6, initialisé avec toutes les cases à nil
  }

  // estVide : champBataille -> Bool
  // Renvoie vrai si le champ de bataille ne contient aucune cartes
  // Renvoie faux sinon
  public func estVide()->Bool{
    return self.caseVide(pos:"A1") && self.caseVide(pos:"A2") && self.caseVide(pos:"A3") && self.caseVide(pos:"F1") && self.caseVide(pos:"F2") && self.caseVide(pos:"F3")

  }

  // caseVide : champBataille x String -> Bool
  // Renvoie vrai si une position du CB est vide
  // Renvoie faux sinon
  public func caseVide(pos:String)->Bool{
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

    if carte != nil{
      reponse = false
    }
    return reponse
  }

  // positionCarte : champBataille x Carte -> String
  // Renvoie la position de la carte sur le champ de bataille
  // renvoie vide si la carte n'est pas présente sur le champ de bataille
  public func positionCarte(c:Carte)->String?{
    var position : String? = nil
    let positions = ["A1", "A2", "A3","F1", "F2", "F3"]
    for pos in positions {
      let carte = self.CartePosition(pos:pos)
      if let carte = carte{
        if c.estDuType() == carte.estDuType(){
          position = pos
        }
      }
    }
    return position
  }

  // CartePosition : champBataille x String -> Carte
  // Renvoie la carte de la position sur le champ de bataille
  // renvoie vide si pas de carte
  public func CartePosition(pos:String)->Carte?{
    var carte : Carte?

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
  //                  Ajout d'un paramètre "cdb" qui est le champ de bataille du joueur qui attaque
  public func peutAttaquer(c:Carte,pos:String,cdb:ChampBataille)->Bool{
    var reponse : Bool = false
    if(!self.caseVide(pos: pos)){ //Retourne true si la case n'est pas vide
      let type_carte : String = c.estDuType()
      let position_carte = cdb.positionCarte(c:c)
      if let position_carte = position_carte {
        switch type_carte{

        case "soldat","garde": //Le soldat ou le garde peut attaquer la position devant lui, il doit donc être positionné en F* et doit attaquer une position F* équivalente
          if (position_carte=="F1" && pos=="F3") || (position_carte=="F2" && pos=="F2") || (position_carte=="F3" && pos=="F1"){
            reponse = true
          }

        case "archer": //L'archer peut attaquer les 4 posiitons devant lui, comme pour un cavalier
          if ((position_carte=="A1" || position_carte=="A3") && pos=="F2"){
            reponse=true
          }
          if position_carte=="A2" && (pos=="F3" || pos=="F1"){
            reponse=true
          }
          if (position_carte=="F1" && (pos=="A2" || pos=="F1" )){
            reponse=true
          }
          if position_carte=="F2" && (pos=="A3" || pos=="A1"){
            reponse=true
          }
          if position_carte=="F3" && (pos=="A2" || pos=="F3"){
            reponse=true
          }


        case "roi1"://Le roi peut attaquer toute la ligne devant lui, il peut aussi attaquer la position à une distance 2 de lui. Le roi1 est donc positionné en F* ou A*
          if position_carte=="F1" || position_carte=="F2" || position_carte=="F3"{ //Si le roi 1 est en F*, il peut attaquer toute la ligne avant adverse
            if pos=="F1" || pos=="F2" || pos=="F3"{
              reponse = true
            }
          }

          if (position_carte=="A1" && pos=="F3") || (position_carte=="A2" && pos=="F2") || (position_carte=="A3" && pos=="F1"){ //Si le roi1 est sur une des positions arrière (A*), il peut attaquer une position à distance 2 sur la ligne F* adverse
            reponse=true
          }

          if (position_carte=="F1" && pos=="A3") || (position_carte=="F2" && pos=="A2") || (position_carte=="F3" && pos=="A1"){ //Si le roi1 est sur une des positions avant (F*), il peut attaquer une position à distance 2 sur la ligne A* adverse
            reponse=true
          }

        case "roi2": //Le roi2 peut attaquer toute la ligne devant lui, il doit donc être en F*
          if position_carte=="F1" || position_carte=="F2" || position_carte=="F3"{
            if pos=="F1" || pos=="F2" || pos=="F3"{
              reponse = true
            }
          }
        default:
          break;
        }
      }

    }
    return reponse
  }


  // placerCarte : ChampBataille x Carte x String ->
  // la fonction verifie si le front est plein met la carte en arriere
  // sinon ajoute au front sur la colonne "pos"
  //Note developpeurs : Les cas qui engendrent des erreurs ne sont pas décrits.
  //                  : Que faire si le champ de bataille est plein ? Actuellement cela remplace la carte en position arrière.
  //                  : Que faire si la position passé en paramètre est incorrecte? Il faudrait modifier les specifications de la fonction pour renvoyer nil ou lever une erreur.
  public func placerCarte(c:Carte,pos:String){
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
    } //Si la positon arrière n'est pas libre, alors cela écrase la carte déjà présente
  }

  // supprimerCarte : ChampBataille x Carte ->
  // supprimer une carte du champ de bataille

  public func supprimerCarte(c:Carte){
    let position = self.positionCarte(c: c) //On récupère la position de la carte, cela nous renvoie nil si la carte n'est pas dans le champ de bataille
    if let position = position { //On teste bien que la carte est dans notre champ de bataille
      switch position{ //Suivant la position qui est renvoyé, on accède à différents indice de notre champ de bataille
      case "A1":
        self.champ[0]=nil //On remplace simplement notre carte par nil
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


  public func makeIterator()->IteratorChampBataille{
    return IteratorChampBataille(self)
  }
}

public struct IteratorChampBataille : IteratorChampBatailleProtocol{
  public typealias Carte = carte
  public typealias ChampBataille = champBataille
  private let champ_bataille : ChampBataille
  private var courant : Int = 0
  fileprivate init(_ cb: ChampBataille){
    self.champ_bataille = cb
  }

  //Note developpeurs: Comme notre champ de bataille est un tableau de Carte?, il faut faire attention à ne pas mettre notre courant à nil.
  //                  Si on trouve une case du champ de bataille à nil, on passe à la suivante.
  //                  Sinon (si la case n'est pas vide) c'est un next() normal.
  //                  Next() renvoie nil si on est à la dernière case du champ de bataille.
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
