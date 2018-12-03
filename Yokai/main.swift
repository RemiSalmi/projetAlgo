
//Main du jeu Yokai
Jeu = Jeu()
let pile_face = Int.random(in : 1..<3) //Random d'un nombre entre 1 et 2 pourdéfinir lequel des deux joueurs doit commencer.

joueur = Jeu.getJoueur(jeu: Jeu, idjoueur: pile_face)

while !Jeu.getJoueur(jeu: Jeu, idjoueur: 1).estGagnant() and !Jeu.getJoueur(jeu: Jeu, idjoueur: 2).estGagnant(){

  if(!joueur.mainEstVide(joueur: joueur)){
    print("Pour déplacer un yokai taper: 1")
  }

  if(!joueur.reserveEstVide(joueur: joueur)){
    print("Pour parachuter un yokai taper: 2")
  }

  //Tester avec readLine()

  //Si choix 1 :
      IteratorMain = joueur.getMain(joueur: joueur)
      for i in 0..<joueur.tailleMain(){//Affichage des Yokai disponibles
          print("Nom du Yokai:",IteratorMain.nom,"Id du Yokai:",IteratorMain.id)
          IteratorMain.next()
      }
      //A faire: On recupère le choix du joueur
      if joueur.estEnMain(j: joueur, y: yokai){ //On verifie que le Yokai choisit appartient au joueur
          IteratorDeplacement = yokai.makeItDeplacement(y: yokai)//On affiche les actions disponibles pour le Yokai
          for i in 0..<tailleDeplacement{
            print("Deplacement:",IteratorDeplacement.nom)
          }
          //A faire: On recupère le choix du joueur
        if peutAller(y: yokai, coord_x: x, coord_y: y){ //On verifie que l'action choisit correspond bien aux actions disponibles du Yokai en question
          yokai.deplacer(y: yokai, p: positon)
        }
      }

  //Si choix 2 :
      IteratorReserve = joueur.getReserve(joueur: joueur)//On affiche les actions disponibles pour le Yokai
      for i in 0..<tailleDeplacement{
        print("Deplacement:",IteratorDeplacement.nom)
      }
      //A faire: On recupère le choix du joueur
      if joueur.estEnReserve(j: joueur, y : yokai){//On verifie que le Yokai choisit appartient à la réserve du joueur

        IteratorPlateau = Jeu.makeItPlateau(jeu: Jeu)//On affiche les cases libre du jeu
        for i in 0..<12{
          if !IteratorPlateau.est_Occupe(p: IteratorPlateau){
            print("Position: x=",IteratorPlateau.get_CoordX,"y=",IteratorPlateau.get_CoordY)
          }
        }
        //A faire: On recupère la case souhaitée
        if !est_Occupe(p: positon){
          joueur.parachuter(j: joueur, y: Yokai, p: position)
        }
      }

  //FinSi
  joueur = Jeu.getJoueurSuivant(jeu: Jeu, joueur:joueur)
  
}
