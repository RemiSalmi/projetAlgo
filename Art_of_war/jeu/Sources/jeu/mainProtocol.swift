//Guillaume
// la main est une collection de Carte
// Cette collection peut être parcourue par un itérateur.

//La main est une liste
public protocol mainProtocol : Sequence{
  associatedtype IteratorMainProtocol : IteratorProtocol where IteratorMain.Element == Carte
  associatedtype Carte : carteProtocol
  associatedtype Main : mainProtocol

  // init : Int -> Main
  // création d'une main, initialisée avec un Roi n
  // Pre : n doit être 1 ou 2
  // Post : on crée une carte "roi1" ou "roi2"
  init(n:Int)

  // mainVide : Main -> Bool
  // indique si la main est vide ou pas
  // Post : retourne True si main vide false sinon
  func mainVide()->Bool

  // tailleMain : Main-> Int
  // indique le nombre de cartes dans la main
  // Post : si la main est vide renvoyer 0
  func tailleMain()->Int

  // ajouterCarteMain :  Main x Carte -> Main
  // ajoute UNE seule carte dans une main
  // Pre : la carte doit provenir de la pioche ???
  // Post :tailleMain=tailleMain+1
  @discardableResult
  mutating func ajouterCarteMain(c:Carte) -> Main

  // setCarte :  Main x Int -> Carte
  // renvoie la carte de la main à la position pos
  // Pre : la position doit etre entre 1 et tailleMain()
  func setCarte(pos:Int) -> Carte

  // supprimerCarte :  Main x Int -> Carte
  // renvoie la carte de la main à la position pos et la supprime de la main
  // Pre : la position doit etre entre 1 et tailleMain()
  @discardableResult
  mutating func supprimerCarte(pos:Int) -> Carte

  func makeIterator()->IteratorMainProtocol
}

protocol IteratorMainProtocol : IteratorProtocol{
  associatedtype Carte = carte


  mutating func next()->Carte?
}
