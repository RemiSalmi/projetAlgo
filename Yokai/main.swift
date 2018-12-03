
//Main du jeu Yokai
Jeu = Jeu()
let pile_face = Int.random(in : 1..<3) //Random d'un nombre entre 1 et 2 pourdéfinir lequel des deux joueurs doit commencer.

joueur = Jeu.getJoueur(idjoueur: pile_face)

while !Jeu.getJoueur(idjoueur: 1).estGagnant() and !Jeu.getJoueur(jeu: Jeu, idjoueur: 2).estGagnant(){

  var autoriseDeplacer : Bool = false
  var autoriseParachuter : Bool = true

  if(!joueur.mainEstVide()){
    print("Pour déplacer un yokai taper: 1")
  }

  if(!joueur.reserveEstVide()){
    print("Pour parachuter un yokai taper: 2")
  }

  //Récupération du choix du joueur
  print("Faites votre choix:")
  if let read = readLine() {
    if let num = Int(read) {
        if num==1 and autoriseDeplacer{ //Si le joueur choisit de déplacer

          IteratorMain = joueur.makeItMain()
          while let yokai = IteratorMain.next() {//Affichage des Yokai disponibles
              print("Nom du Yokai:",yokai.nom,"Id du Yokai:",yokai.id)
          }

          var yokai = nil
          while yokai == nil{
            print("Entrer l'id du Yokai de votre choix:")//On recupère le choix du joueur
            if let read = readLine() {
                if let idyokai = Int(read) {
                    print("Votre choix, le Yokai:",idyokai)
                }
                else{
                  print("Attention votre choix n'est pas un entier.")
                }
            }
            yokai = joueur.getYokaiById(id: idyokai)
          }

          if joueur.estEnMain(y: yokai){ //On verifie que le Yokai choisit appartient au joueur
              print("Deplacement disponibles:")
              IteratorDeplacement = yokai.makeItDeplacement()//On affiche les actions disponibles pour le Yokai
              while let deplacement = IteratorDeplacement.next(){
                print("Deplacement:",deplacement.nom)
              }

              deplacement = "invalide"
              while !yokai.peutAller(d: deplacement){ //On verifie que l'action choisit correspond bien aux actions disponibles du Yokai en question
                print("Entrer votre choix:")//On recupère le choix du joueur
                if let read = readLine() {
                    if let deplacement = String(read) {
                        print("Votre choix :",deplacement)
                    }
                    else{
                      print("Attention votre choix n'est pas une chaîne de caractère.")
                    }
                }
              }
              position = yokai.futurPosition(d: deplacement)
              yokai.deplacer(p: positon)
          }

        }
        else if num==2 and autoriseParachuter{ //Si le joueur choisit de parachuter
          IteratorReserve = joueur.makeItReserve()//On affiche les actions disponibles pour le Yokai
          while let reserveYokai =  IteratorReserve.next() {
            print("Nom du Yokai:",reserveYokai.nom,"Id du Yokai:",reserveYokai.id)

          }

          var yokai = nil
          while yokai == nil{
            print("Entrer l'id du Yokai de votre choix:")//On recupère le choix du joueur
            if let read = readLine() {
                if let idyokai = Int(read) {
                    print("Votre choix, le Yokai:",idyokai)
                }
                else{
                  print("Attention votre choix n'est pas conforme.")
                }
            }
            yokai = joueur.getYokaiById(id: idyokai)
          }

          if joueur.estEnReserve(y : yokai){//On verifie que le Yokai choisit appartient à la réserve du joueur

            //On affiche les cases libre du jeu
            IteratorPlateau = Jeu.makeItPlateau()
            while let position = IteratorPlateau.next(){
              if !position.est_Occupe(){
                print("Position: x=",position.get_CoordX(),"y=",position.get_CoordY())
              }
            }

            //On récupère la case souhaitée par le joueur
            position = nil
            while yokai == nil{
              print("Entrer la coordonnées x de la case souhaitée:")//On recupère le choix pour x
              if let read = readLine() {
                  if let x = Int(read) {
                      print("Votre choix, x:",idyokai)
                  }
                  else{
                    print("Attention votre choix de la coordonnée x n'est pas conforme.")
                  }
              }
              print("Entrer la coordonnées y de la case souhaitée:")//On recupère le choix pour y
              if let read = readLine() {
                  if let y = Int(read) {
                      print("Votre choix, y:",idyokai)
                  }
                  else{
                    print("Attention votre choix de la coordonnée y n'est pas conforme.")
                  }
              }
              position = Jeu.getPositionJeu(coord_x: x, coord_y: y)
            }

            //On vérifie que la case est libre et on parachute
            if !est_Occupe(p: positon){
              joueur.parachuter(y: Yokai, p: position)
            }
          }
        }
        else{
          print("Attention votre choix n'est pas un entier.")
        }
    }
  }

  joueur = Jeu.getJoueurSuivant(joueur:joueur)
}
