
//Main du jeu Yokai
Jeu = Jeu()
let pile_face = Int.random(in : 1..<3) //Random d'un nombre entre 1 et 2 pourdéfinir lequel des deux joueurs doit commencer.

joueur = Jeu.getJoueur(jeu: Jeu, idjoueur: pile_face)

while !Jeu.getJoueur(jeu: Jeu, idjoueur: 1).estGagnant() and !Jeu.getJoueur(jeu: Jeu, idjoueur: 2){

  if(!joueur.mainEstVide(joueur: joueur)){
    print("Pour déplacer un yokai taper: 1")
  }

  if(!joueur.reserveEstVide(joueur: joueur)){
    print("Pour parachuter un yokai taper: 2")
  }

  //Tester avec readLine()

  //Si choix 1 :
      //Affichage des Yokai disponibles
      //On recupère le choix du joueur
      //On verifie que le Yokai choisit appartient au joueur
      //On affiche les actions disponibles pour le Yokai
      //On recupère le choix du joueur
      //On verifie que l'action choisit correspond bien aux actions disponibles du Yokai en question
      //On réalise le déplacement

  //Si choix 2 :
      //Affichage des Yokai en réserve
      //On recupère le choix du joueur
      //On verifie que le Yokai choisit appartient à la réserve du joueur
      //On affiche les cases libre du jeu
      //On recupère la case souhaitée
      //On verifie que la case choisie est libre
      //On réalise le parachutage








}
