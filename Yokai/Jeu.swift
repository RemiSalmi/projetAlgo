//Un jeu possède un terrain (12 cases) et deux joueurs.
protocol JeuProtocol{
  associatedtype PositionPlateauIterator: IteratorProtocol
  //Le terrain est un tableau d'exactement 12 positions correspondant aux 12 cases d'un plateau de jeu Yokai.
  var terrain : [PositonProtocol]
  var joueur1 : JoueurProtocol
  var joueur2 : JoueurProtocol

  //init : -> Jeu
  //Post :
  //      L'attribut terrain a été initialisé avec 12 positions valide correspondant aux 12 cases d'un plateau de jeu Yokai
  //      L'attribut joueur1 a été initialisé avec une main comportant les 5 yokais de départs et une réserve vide.
  //        Les 5 yokais du joueur1 ont pour attribut position une des 12 Position de l'attribut terrain, conformement aux règles du jeu de yokai.
  //      L'attribut joueur2 a été initialisé de la même manière que le joueur1.
  //      Le joueur1 correspond au joueur de bas de plateau.
  //      Le joueur2 correspond au joueur de haut de plateau.
  init()->JeuProtocol

  //getJoueur: Jeu x Int -> Joueur
  //Renvoie un joueur, l'entier en paramètre est une valeur 1 ou 2.
  //Post :
  //    Renvoie le joueur 1 ssi : getJoueur(jeu: Jeu, idjoueur: 1)
  //    Renvoie le joueur 2 ssi : getJoueur(jeu: Jeu, idjoueur: 2)
  func getJoueur(jeu: JeuProtocol, idjoueur: Int)->JoueurProtocol

  //getJoueurSuivant: Jeu x Joueur -> Joueur
  //Renvoie le joueur 1, si le joueur 2 est passé en paramètre
  //Renvoie le joueur 2, si le joueur 1 est passé en paramètre
  func getJoueurSuivant(jeu: JeuProtocol, joueur: JoueurProtocol)->JoueurProtocol

  //Iterator sur les positions de l'attribut plateau
  func makeItPlateau(jeu: JeuProtocol)->PositionPlateauIterator

}
