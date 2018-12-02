//Un joueur contient un numéro, des Yokais dans sa main  et une réserve de Yokais vide

protocol JoueurProtocol{
  associatedtype yokaisIterator : IteratorProtocol
  associatedtype reserveIterator : IteratorProtocol

  var num : Int
  //var sensDuJoueur : String

  //init : Int -> joueur
  //#Création d'un joueur
  //#Pré un joueur commence avec 4 Yokais dans sa main (1 Koropokkuru, 1 Kitsune, 1 Tanuki, 1Kodama) et sa réserve est vide
  //#données NumJoueur est un int qui prend seulement les valeurs 1 ou 2
  init(NumJoueur: Int)->JoueurProtocol

  //estGagnant : joueur -> Bool
  //#Vérfie si un joueur viens de gagner la partie pendant le tour en cours
  //#Pré Le joueur doit avoir été créé
  func estGagnant(joueur: JoueurProtocol)->Bool

  //getYokais : joueur -> IteratorProtocol
  //Iterator sur les Yokais sur le plateau du joueur (exemple Kodama1;Tanuki1;...)
  func getMain(joueur: JoueurProtocol)->yokaisIterator

  //mainEstVide : joueur -> Bool
  //Verifie si la main du joueur est vide ou pas
  //Renvoie true si la main est vide, false sinon
  func mainEstVide(joueur: JoueurProtocol)->Bool

  //getReserve : joueur -> IteratorProtocol
  //Iterator sur les Yokais de la réserve du joueur
  func getReserve(joueur: JoueurProtocol)->reserveIterator

  //reserveEstVide : joueur -> Bool
  //Verifie si la réserve du joueur est vide ou pas
  //Renvoie true si la réserve est vide, false sinon
  func reserveEstVide(joueur: JoueurProtocol)->Bool

  //ajoutReserve : joueur x Yokais -> joueur
  //ajoute le Yokai passé en paramètre dans la reserve du joueur passé en paramètre
  mutating func ajoutReserve(j: JoueurProtocol, y :Yokai)->JoueurProtocol

  //enleverReserve : joueur x Yokai -> Joueur
  //enleve le yokai passe en parametre de la reserve du joueur passe en parametre
  //Pré: le yokai doit être present dans la reserve du joueur
  mutating func enleverReserve(j: JoueurProtocol, y: Yokai)->JoueurProtocol

  //estEnReserve : joueur x Yokai -> Bool
  //renvoie true si le Yokai passe en parametre est dans la reserve du joueur
  func estEnReserve(j: JoueurProtocol, y : Yokai)->Bool

  //estEnMain :  joueur x Yokai -> Bool
  //renvoie true si le yokai passe en parametre est dans la main du joueurProtocol
  func estEnMain(j: JoueurProtocol, y: Yokai)->Bool

/***
  //monAdversaire : joueur -> joueur
  //Renvoie l'adversaire (un joueur) du joueur passe en parametre
  func monAdversaire(j : joueur)-> joueur
***/

  //Parachuter : joueur x Yokai x Position-> joueur
  //Prend un Yokai de la résevre du joueur et le met dans sa main avec la positon passé en paramètre
  //Pré : Le Yokai doit etre présent dans la réserve
  // L'emplacement de la position doit être valide
  //Post : enleve le Yokai de la reserve du joueur et le met dans sa main
  //Si le Yokai donnée en paramètre est un Kodama :
  //  Si le parachutage à lieu dans la zone de l'adversaire, le Yokai Kodama se transforme en Kodama Locked
  mutating func parachuter(j: JoueurProtocol, y: Yokai, p: PositonProtocol)-> JoueurProtocol

  //manger : joueur x Yokai -> joueur
  //rajoute au joueur passé en parametre le Yokai passé en paramètre dans sa rserve
  //Post si le Yokai était samourai il ne l'ai plus
  //Supprime le Yokai de la main de l'autre joueur
  // Pré : Le yokai devait être dans la main du joueur adverse
  mutating func manger(j: JoueurProtocol, y :Yokai)->JoueurProtocol

  //ajouterMain joueur x Yokai -> joueur
  //Ajouter le yokai passé en parametre à la main du joueur passé en paramètre
  mutating func ajoutMain(j: JoueurProtocol, y : Yokai)->JoueurProtocol

  //enleverMain joueur x Yokai -> joueur
  //Enleve le yokai passe en parametre de la main du joueur
  //Pré : le yokai doit être dans la main du joueur
  mutating func enleverMain(j: JoueurProtocol, y: Yokai)->JoueurProtocol

}
