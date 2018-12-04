import Foundation

//Un joueur contient un numéro, des Yokais dans sa main  et une réserve de Yokais vide

public protocol JoueurProtocol{
  associatedtype mainIterator : IteratorProtocol
  associatedtype reserveIterator : IteratorProtocol
  associatedtype Yokai : YokaiProtocol
  associatedtype Position : PositionProtocol

  var num : Int { get set }


  //init : Int -> joueur
  //#Création d'un joueur
  //#Pré un joueur commence avec 4 Yokais dans sa main (1 Koropokkuru, 1 Kitsune, 1 Tanuki, 1Kodama) et sa réserve est vide
  //#données NumJoueur est un int qui prend seulement les valeurs 1 ou 2
  //Le placement des Yokais lors du début de la partie se font conformément aux regles du jeu voir les regle de Yokai No Morï
  init(NumJoueur: Int)

  //estGagnant : joueur -> Bool
  //#Vérfie si un joueur viens de gagner la partie pendant le tour en cours
  //#Pré Le joueur doit avoir été créé
  //Le joueur est gagner quand son roi atteint la dernière ligne et reste dessu 1 tour sans se faire manger ou quand on mange le roi de l'adversaire (le Koropokkuru)
  func estGagnant()->Bool

  //makeItMain : joueur -> IteratorProtocol
  //Crée un Iterator sur les Yokais de la main du joueur
  func makeItMain()->mainIterator

  //mainEstVide : joueur -> Bool
  //Verifie si la main du joueur est vide ou pas
  //Renvoie true si la main est vide, false sinon
  func mainEstVide()->Bool

  //makeItReserve : joueur -> IteratorProtocol
  //Crée un Iterator sur les Yokais de la réserve du joueur
  func makeItReserve()->reserveIterator

  //reserveEstVide : joueur -> Bool
  //Verifie si la réserve du joueur est vide ou pas
  //Renvoie true si la réserve est vide, false sinon
  func reserveEstVide()->Bool

  //ajoutReserve : joueur x Yokais -> joueur
  //ajoute le Yokai passé en paramètre dans la reserve du joueur passé en paramètre le Yokai ne dois pas deja etre dans la reserve
  mutating func ajoutReserve(y :Yokai)->Self

  //enleverReserve : joueur x Yokai -> Joueur
  //enleve le yokai passe en parametre de la reserve du joueur passe en parametre
  //Pré: le yokai doit être present dans la reserve du joueur
  mutating func enleverReserve(y: Yokai)->Self

  //estEnReserve : joueur x Yokai -> Bool
  //renvoie true si le Yokai passe en parametre est dans la reserve du joueur
  func estEnReserve(y : Yokai)->Bool

  //estEnMain :  joueur x Yokai -> Bool
  //renvoie true si le yokai passe en parametre est dans la main du Joueur
  func estEnMain(y: Yokai)->Bool



  //Parachuter : joueur x Yokai x Position-> joueur
  //Prend un Yokai de la résevre du joueur et le met dans sa main avec la position passé en paramètre
  //Pré : Le Yokai doit etre présent dans la réserve
  // L'emplacement de la position doit être valide
  //Post : enleve le Yokai de la reserve du joueur et le met dans sa main
  //Si le Yokai donnée en paramètre est un Kodama :
  //  Si le parachutage à lieu dans la zone de l'adversaire, le Yokai Kodama se transforme en Kodama Locked
  mutating func parachuter(y: Yokai, p: Position)-> Self

  //manger : joueur x Yokai -> joueur
  //rajoute au joueur le Yokai passé en paramètre dans sa reserve
  //Post si le Yokai était samourai il ne l'ai plus
  //Supprime le Yokai de la main de l'autre joueur
  // Pré : Le yokai devait être dans la main du joueur adverse
  mutating func manger(y :Yokai)->Self

  //ajouterMain joueur x Yokai -> joueur
  //Ajouter le yokai passé en parametre à la main du joueur passé en paramètre le Yokai ne doit pas deja etre dans la main du joueur
  mutating func ajoutMain(y : Yokai)->Self

  //enleverMain joueur x Yokai -> joueur
  //Enleve le yokai passe en parametre de la main du joueur
  //Pré : le yokai doit être dans la main du joueur
  mutating func enleverMain(y: Yokai)->Self

  //tailleMain : Joueur -> Int
  //Renvoie le nombre de Yokai dans la Main du joueur passé en parametre
  func tailleMain()->Int

  //tailleReserve : Joueur -> Int
  //Renvoie le nombre de Yokai dans la reserve du joueur
  func tailleReserve()->Int

  //getYokaiById : Joueur x Int -> Yokai?
  //Renvoie le Yokai qui à l'id correspondant à l'int passé en parametre si le yokai n'est pas trouvé cela renvoie Vide
  func getYokaiById(id : Int)->Yokai?

}
