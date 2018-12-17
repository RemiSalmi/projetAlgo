public protocol carteProtocol {

associatedtype Carte : carteProtocol

    // init :  String -> Carte
    // création d’une carte à partir d’un type
    // Pre: String représente le type d’une carte (soldat,archer,garde,roi1,roi2)
    //      sinon la création échoue
    // si c'est un soldat (attaque : taille main, position défensive : 2, position offensive : 1)
    // si c'est un archer (attaque : 1, position défensive : 2, position offensive : 1)
    // si c'est un garde (attaque : 1, position défensive : 3, position offensive : 2)
    // les dégats sont initialisés à 0
    init(type:String)

    // valeurAttaque :  Carte -> Int
    // indique la valeur d'attaque d’une carte en fonction de son type
    func valeurAttaque()->Int

    // degat :  Carte -> Int
    // indique les degats d’une carte
    func degat()->Int

    // changerDegat :  Carte x Int ->
    // modifie les degats d'une carte
    @discardableResult
    mutating func changerDegat(nb:Int)

    // valeurDefenseD :  Carte -> Int
    // indique la valeur de défense en position défensive d’une carte en fonction de son type
    func valeurDefenseD()->Int

    // valeurDefenseO :  Carte -> Int
    // indique la valeur de défense en position offensive d’une carte en fonction de son type
    func valeurDefenseO()->Int

    // estDuType :  Carte -> String
    // indique le type d'une carte (soldat,archer,garde,roi)
    func estDuType()->String

    // estOffensive :  Carte -> Bool
    // indique si une carte est tournée en position offensive (horizontale)
    func estOffensive()->Bool

    // changerPosition : Carte ->
    // met la carte en position offensive (horizontale) ou defensive (vertical)
    @discardableResult
    mutating func changerPosition()
}
