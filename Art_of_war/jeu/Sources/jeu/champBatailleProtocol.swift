//Guillaume
// le champBataille est une collection de Carte ou vide
// Cette collection peut être parcourue par un itérateur.

//Tableau de 6 cases de type : Carte?
public protocol champBatailleProtocol : Sequence{
  associatedtype IteratorChampBatailleProtocol : IteratorProtocol where IteratorChampBataille.Element == Carte
  associatedtype ChampBataille : champBatailleProtocol
  associatedtype Carte : carteProtocol

  // init :  -> ChampBataille
  // création d’un ChampBataille vide
  init()

  // estVide : champBataille -> Bool
  // Renvoie vrai si le champ de bataille ne contient aucune cartes
 	// Renvoie faux sinon
  func estVide()->Bool

  // caseVide : champBataille x String -> Bool
  // Renvoie vrai si une position du CB est vide
 	// Renvoie faux sinon
  func caseVide(pos:String)->Bool

  // positionCarte : champBataille x Carte -> String
  // Renvoie la position de la carte sur le champ de bataille
  // renvoie vide si la carte n'est pas présente sur le champ de bataille
  func positionCarte(c:Carte)->String?

  // CartePosition : champBataille x String -> Carte
  // Renvoie la carte de la position sur le champ de bataille
  // renvoie vide si pas de carte
  func CartePosition(pos:String)->Carte?

  // peutAttaquer : ChampBataille x Carte x String ->Bool
  // indique si une carte peut attaquer une certaine position du champs de bataille adverse
  // True si peut attaquer False sinon
  func peutAttaquer(c:Carte,pos:String,cdb:ChampBataille)->Bool

  // placerCarte : ChampBataille x Carte x String ->
  // la fonction verifie si le front est plein met la carte en arriere
  // sinon ajoute au front sur la colonne "pos"
  @discardableResult
  mutating func placerCarte(c:Carte,pos:String)

  // supprimerCarte : ChampBataille x Carte ->
  // supprimer une carte du champ de bataille
  @discardableResult
  mutating func supprimerCarte(c:Carte)

  func makeIterator()-> IteratorChampBatailleProtocol
}



protocol IteratorChampBatailleProtocol : IteratorProtocol{
  associatedtype Carte : carteProtocol

    func IteratorChampBataille()->Self
    mutating func next()->Carte?
}
