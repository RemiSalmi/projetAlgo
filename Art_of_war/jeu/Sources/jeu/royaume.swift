public class royaume : royaumeProtocol {
  public typealias Royaume = royaume
  public typealias Carte = carte
  var royaume : [Carte]


  // init :  -> Royaume
  // Création d'un royaume initialisé à vide
  // Note : le royaume est une collection de Carte géré comme une file
  public required init(){
    self.royaume = [Carte]()
  }

  // ajouterCarte : Royaume x Carte -> Royaume
  // Ajout d'une carte dans le royaume
  // Note : la carte est ajoutée à la fin du royaume (FILE)

  public func ajouterCarte(c:Carte){
    self.royaume.append(c)
  }

  // recupererCarte : Royaume -> Carte
  // Retirer une carte du royaume la premiere de la file
  @discardableResult
  public func recupererCarte()->Carte{
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

  public func makeIterator()->IteratorRoyaume{
    return IteratorRoyaume(self)
  }

}



// Note dev : Création d'un Iterateur sur le royaume pour parcourir les cartes dans le main
public struct IteratorRoyaume : IteratorRoyaumeProtocol{
  public typealias Carte = carte
  public typealias Royaume = royaume
  private let royaume : Royaume
  private var courant : Int = 0
  fileprivate init(_ r: Royaume){
    self.royaume = r
  }

  public mutating func next()->Carte?{
    let carte : Carte
    guard self.courant < self.royaume.royaume.count else {
      return nil
    }
    carte = self.royaume.royaume[self.courant]
    self.courant = self.courant + 1
    return carte

  }
}
