//Un joueur contient un numéro, des Yokais sur plateau et une réserve de Yokais vide

protocol joueurProtocol{
  associatedtype yokaisIterator : IteratorProtocol
  associatedtype reserveIterator : IteratorProtocol

  //init : Int -> joueur
  //#Création d'un joueur
  //#Pré un joueur commence avec 4 Yokais sur le plateau (1 Koropokkuru, 1 Kitsune, 1 Tanuki, 1Kodama) et sa réserve est vide
  //#données NumJoueur est un int qui prend seulement les valeurs 0 ou 1
  init(NumJoueur : Int)->joueur

  //estGagnant : joueur -> Bool
  //#Vérfie si un joueur viens de gagner la parti pendant le tour en cours
  //#Pré Le joueur doit avoir été créé
  func estGagnant(joueur : joueur)->Bool

  //getYokais : joueur -> String
  //Renvoie les noms et les numéros de tous les Yokais du plateau du joueur (exemple Kodama1;Tanuki1;...)
  func getYokais(joueur : joueur)->yokaisIterator

  //getReserve : joueur -> String
  //Renvoie les noms et les numéros de tous les Yokais en réserve du joueur
  func getReserve(joueur : joueur)->reserveIterator

  //ajoutReserve : joueur x Yokais -> joueur
  //ajoute le Yokai passé en paramètre dans la reserve du joueur passé en paramètre
  mutating func ajoutReserve(j : joueur, y : Yokai)-> joueur 



}
