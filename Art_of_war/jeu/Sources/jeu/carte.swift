
//Utilisation de Enum pour les différents types de cartes
enum TypeCarte : String {
case soldat="soldat", archer="archer", garde="garde", roi1="roi1", roi2="roi2"
}

public struct carte : carteProtocol {
  public typealias Carte = carte
  var nom : TypeCarte
  var attaque : Int
  var defensif : Int
  var offensif : Int
  var degats: Int
  var estOffensif : Bool

  // init :  String -> Carte
  // création d’une carte à partir d’un type
  // Pre: String représente le type d’une carte (soldat,archer,garde,roi1,roi2)
  //      sinon la création échoue
  // si c'est un soldat (attaque : taille main, position défensive : 2, position offensive : 1)
  // si c'est un archer (attaque : 1, position défensive : 2, position offensive : 1)
  // si c'est un garde (attaque : 1, position défensive : 3, position offensive : 2)
  // les dégats sont initialisés à 0
  public init?(type: String){

    self.degats = 0
    self.estOffensif = false

    switch type {

    case "soldat" :
      self.nom = TypeCarte.soldat
      self.attaque = 1
      self.defensif = 2
      self.offensif = 1
    case "archer" :
      self.nom = TypeCarte.archer
      self.attaque = 1
      self.defensif = 2
      self.offensif = 1
    case "garde" :
      self.nom = TypeCarte.garde
      self.attaque = 1
      self.defensif = 3
      self.offensif = 2
    case "roi1" :
      self.nom = TypeCarte.roi1
      self.attaque = 1
      self.defensif = 4
      self.offensif = 4
    case "roi2" :
      self.nom = TypeCarte.roi2
      self.attaque = 1
      self.defensif = 5
      self.offensif = 4
    default:
      //Si la chaîne de caractère n'est pas conforme
      return nil
    }

  }


  // valeurAttaque :  Carte -> Int
  // indique la valeur d'attaque d’une carte en fonction de son type
  public func valeurAttaque()->Int{
    return self.attaque
  }

  // degat :  Carte -> Int
  // indique les degats d’une carte
  public func degat()->Int{
    return self.degats
  }

  // changerDegat :  Carte x Int ->
  // modifie les degats d'une carte
  @discardableResult
  public mutating func changerDegat(nb:Int){
    self.degats = nb
  }

  // valeurDefenseD :  Carte -> Int
  // indique la valeur de défense en position défensive d’une carte en fonction de son type
  public func valeurDefenseD()->Int{
    return self.defensif
  }

  // valeurDefenseO :  Carte -> Int
  // indique la valeur de défense en position offensive d’une carte en fonction de son type
  public func valeurDefenseO()->Int{
    return self.offensif
  }

  // estDuType :  Carte -> String
  // indique le type d'une carte (soldat,archer,garde,roi)
  public func estDuType()->String{
    return self.nom.rawValue
  }

  // estOffensive :  Carte -> Bool
  // indique si une carte est tournée en position offensive (horizontale)
  public func estOffensive()->Bool{
    return self.estOffensif
  }

  // changerPosition : Carte ->
  // met la carte en position offensive (horizontale) ou defensive (vertical)
  @discardableResult
  public mutating func changerPosition(){
    if self.estOffensif{
      self.estOffensif = false
    }
    else{
      self.estOffensif = true
    }
  }

}
