public struct royaume : royaumeProtocol {

  var royaume : [carte]


  // init :  -> Royaume
  // Création d'un royaume initialisé à vide
  // Note : le royaume est une collection de Carte géré comme une file
  init(){
    self.royaume = [carte]()
  }

  // ajouterCarte : Royaume x Carte -> Royaume
  // Ajout d'une carte dans le royaume
  // Note : la carte est ajoutée à la fin du royaume (FILE)
  @discardableResult
  mutating func ajouterCarte(c:Carte){
    self.royaume.append(c)
  }

  // recupererCarte : Royaume -> Carte
 	 // Retirer une carte du royaume la premiere de la file
   @discardableResult
  mutating func recupererCarte()->Carte{
    if !royaumeVide(){
      var c = self.royaume[0]
      self.royaume.removeFirst()
      return c
    }
    //** Il manque un return pour cette fonction, lorsque l'on ne rentre pas dans le if
  }

  // tailleRoyaume : Royaume -> Int
 	// Renvoie de la taille d'un royaume nombre de cartes
  // si royaume vide renvoyer 0
  func tailleRoyaume()->Int{
    return self.royaume.count
  }

  // royaumeVide : Royaume -> Bool
  // Renvoie vrai si vide
  // faux sinon
  func royaumeVide()->Bool{
    return self.royaume.count == 0
  }

}
