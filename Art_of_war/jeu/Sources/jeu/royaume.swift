public struct royaume : royaumeProtocol {
  public typealias Royaume = royaume
  public typealias Carte = carte
  var royaume : [Carte]


  // init :  -> Royaume
  // Création d'un royaume initialisé à vide
  // Note : le royaume est une collection de Carte géré comme une file
  public init(){
    self.royaume = [Carte]()
  }

  // ajouterCarte : Royaume x Carte -> Royaume
  // Ajout d'une carte dans le royaume
  // Note : la carte est ajoutée à la fin du royaume (FILE)
  @discardableResult
  public mutating func ajouterCarte(c:Carte){
    self.royaume.append(c)
  }

  // recupererCarte : Royaume -> Carte
  // Retirer une carte du royaume la premiere de la file
  @discardableResult
  public mutating func recupererCarte()->Carte{
    let c = self.royaume[0]
    self.royaume.removeFirst()
    return c
  }

  // tailleRoyaume : Royaume -> Int
  // Renvoie de la taille d'un royaume nombre de cartes
  // si royaume vide renvoyer 0
  public func tailleRoyaume()->Int{
    return self.royaume.count
  }

  // royaumeVide : Royaume -> Bool
  // Renvoie vrai si vide
  // faux sinon
  public func royaumeVide()->Bool{
    return self.royaume.count == 0
  }

}
