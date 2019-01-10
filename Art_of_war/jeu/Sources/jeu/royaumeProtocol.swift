public protocol royaumeProtocol {
  associatedtype Royaume : royaumeProtocol
  associatedtype Carte : carteProtocol

  // init :  -> Royaume
  // Création d'un royaume initialisé à vide
  // Note : le royaume est une collection de Carte géré comme une file
  init()

  // ajouterCarte : Royaume x Carte -> Royaume
  // Ajout d'une carte dans le royaume
  // Note : la carte est ajoutée à la fin du royaume (FILE)

  mutating func ajouterCarte(c:Carte)

  // recupererCarte : Royaume -> Carte
  // Retirer une carte du royaume la premiere de la file
  @discardableResult
  mutating func recupererCarte()->Carte

  // tailleRoyaume : Royaume -> Int
  // Renvoie de la taille d'un royaume nombre de cartes
  // si royaume vide renvoyer 0
  func tailleRoyaume()->Int

  // royaumeVide : Royaume -> Bool
  // Renvoie vrai si vide
  // faux sinon
  func royaumeVide()->Bool

}
