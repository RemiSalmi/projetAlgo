//Un jeu possède un terrain (12 cases) et deux joueurs.
protocol JeuProtocol{
  associatedtype PositionPlateauIterator: IteratorProtocol

  //Le terrain est un tableau d'exactement 12 positions correspondant aux 12 cases d'un plateau de jeu Yokai.
  var terrain : [Positon]
  var joueur1 : Joueur
  var joueur2 : Joueur

  //init : -> Jeu
  //Post :
  //      L'attribut terrain a été initialisé avec 12 positions valide correspondant aux 12 cases d'un plateau de jeu Yokai ne pas oublier de placer les cases du plateau en occupé lors du positionnement des Yokais sur le plateau
  //      L'attribut joueur1 a été initialisé avec une main comportant les 5 yokais de départs et une réserve vide. (Il faut creer un Joueur avec un num=1)
  //      Les 5 yokais du joueur1 ont pour attribut position une des 12 Position de l'attribut terrain, conformement aux règles du jeu de yokai.
  //      L'attribut joueur2 a été initialisé de la même manière que le joueur1 (Il faut creer un Joueur avec un num=2).
  init()->Jeu

  //getJoueur: Jeu x Int -> Joueur
  //Renvoie un joueur, l'entier en paramètre est une valeur 1 ou 2.
  //Post :
  //    Renvoie le joueur1 ssi : getJoueur(jeu: Jeu, idjoueur: 1)
  //    Renvoie le joueur2 ssi : getJoueur(jeu: Jeu, idjoueur: 2)
  func getJoueur(idjoueur: Int)->Joueur

  //getJoueurSuivant: Jeu x Joueur -> Joueur
  //Renvoie le joueur1, si le joueur2 est passé en paramètre
  //Renvoie le joueur2, si le joueur1 est passé en paramètre
  func getJoueurSuivant(joueur: Joueur)->Joueur

  //Iterator sur les positions de l'attribut plateau
  func makeItPlateau()->PositionPlateauIterator

  //getPositionJeu : Jeu x Int x Int -> Position?
  //Renvoie la position qui corresopnd au x et y passé en parametre renvoie Vide si le jeu ne comporte pas cette case
  func getPositionJeu(coord_x : Int, coord_y: Int)->Position?



}
