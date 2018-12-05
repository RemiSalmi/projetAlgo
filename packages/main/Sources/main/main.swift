import protocols
//Main du jeu Yokai
var Jeu : JeuProtocol = JeuProtocol()
let pile_face = Int.random(in : 1..<3) //Random d'un nombre entre 1 et 2 pour définir lequel des deux joueurs doit commencer.

print("Le joueur",pile_face,"commence la partie.")
var joueur : JoueurProtocol = Jeu.getJoueur(idjoueur: pile_face) //Retourne un entier, 1 oou 2, pour déterminer lequel des deux joueurs va commencer.

var autoriseDeplacer : Bool
var autoriseParachuter : Bool

while !Jeu.getJoueur(idjoueur: 1).estGagnant() or !Jeu.getJoueur(jeu: Jeu, idjoueur: 2).estGagnant(){

  var autoriseDeplacer : Bool = false
  var autoriseParachuter : Bool = false

  if(!joueur.mainEstVide()){
    print("Pour déplacer un yokai taper: 1")
    autoriseDeplacer = true
  }

  if(!joueur.reserveEstVide()){
    print("Pour parachuter un yokai taper: 2")
    autoriseParachuter = true
  }

  //Récupération du choix du joueur
  print("Faites votre choix:")
  if let read = readLine() {
    if let num = Int(read) {
        if num==1 and autoriseDeplacer{ //Si le joueur choisit de déplacer un Yokai

          //Affichage des Yokais de l'adversaire
          var adversaire : JoueurProtocol = Jeu.getJoueurSuivant(joueur: joueur)
          print("Les Yokais de mon adversaire :")
          var IteratorMain = adversaire.makeItMain()
          while let yokai = IteratorMain.next() {
              print("Nom du Yokai:",yokai.nom,"Id du Yokai:",yokai.id)
              print("Position du Yokai: x=",yokai.position.get_CoordX(),"y=",yokai.position.get_CoordY(),"\n")
          }


          //Affichage de mes Yokais disponibles
          print("Mes Yokais :")
          var IteratorMain = joueur.makeItMain()
          while let yokai = IteratorMain.next() {
              print("Nom du Yokai:",yokai.nom,"Id du Yokai:",yokai.id)
              print("Position du Yokai: x=",yokai.position.get_CoordX(),"y=",yokai.position.get_CoordY(),"\n")
          }

          //On recupère le yokai choisit par le joueur
          var yokai : YokaiProtocol? = nil
          var yokaiEnMain : Bool = false
          while yokai == nil or !yokaiEnMain{
            print("Entrer l'id du Yokai de votre choix:")
            if let read = readLine() {
                if let idyokai = Int(read) {
                    print("Votre choix, le Yokai:",idyokai)
                }
                else{
                  print("Attention votre choix n'est pas un entier.")
                }
            }
            yokai = joueur.getYokaiById(id: idyokai)
            if yokai != nil{
              yokaiEnMain = joueur.estEnMain(y: yokai) //On verifie encore que le Yokai choisit appartient bien dans la main du joueur.
              if !yokaiEnMain{
                print("Le yokai n'est pas dans votre main.")
              }
            }
          }

          //On affiche les déplacement disponibles pour le Yokai.
          print("Deplacement disponibles:")
          var IteratorDeplacement = yokai.makeItDeplacement()
          while let deplacement = IteratorDeplacement.next(){
            print("Deplacement:",deplacement)
          }

          var deplacementAutorise : Bool = false
          while !deplacementAutorise{ //On verifie que l'action choisit correspond bien aux actions disponibles du Yokai en question
            print("Entrer votre choix:")//On recupère le choix du joueur
            if let read = readLine() {
                if let deplacement = String(read) {
                    print("Votre choix :",deplacement)
                }
                else{
                  print("Attention votre choix n'est pas une chaîne de caractères.")
                }
            }
            deplacementAutorise = yokai.peutAller(d: deplacement) //On vérifie que le déplacement est autorisée (voir les specs)
          }
          var position : PositionProtocol = yokai.futurPosition(d: deplacement) //On récupère la future position du Yokai
          yokai.deplacer(p: positon) //On déplace le yokai à sa nouvelle positon


        }
        else if num==2 and autoriseParachuter{ //Si le joueur choisit de parachuter un Yokai

          //On affiche les Yokais disponibles dans la réserve du joueur
          var IteratorReserve = joueur.makeItReserve()
          while let reserveYokai =  IteratorReserve.next() {
            print("Nom du Yokai:",reserveYokai.nom,"Id du Yokai:",reserveYokai.id)
          }

          var yokai : YokaiProtocol? = nil
          var yokaiEnReserve : Bool = false
          while yokai == nil or !yokaiEnReserve{
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
            if yokai != nil{
              yokaiEnReserve = joueur.estEnReserve(y : yokai)//On verifie que le Yokai choisit appartient à la réserve du joueur
              if !yokaiEnReserve{
                print("Le yokai n'est pas dans votre réserve.")
              }
            }
          }

          //On affiche les cases libre du jeu
          var IteratorPlateau = Jeu.makeItPlateau()
          while let position = IteratorPlateau.next(){
            if !position.est_Occupe(){
              print("Position: x=",position.get_CoordX(),"y=",position.get_CoordY())
            }
          }

          //On récupère la case souhaitée par le joueur
          var position : PositionProtocol? = nil
          var positionLibre : Bool = false

          while position == nil or !positionLibre{ //Tant que qu'aucune positon n'a été trouvé ou que la position est occupé, on demande à l'utilisateur de choisir une position conforme.

            //On recupère la coordonnée x de la case vide souhaitée, on vérifie que le readLine est conforme.
            var coordXConforme : Bool = false
            while !coordXConforme{
              print("Entrer la coordonnée x de la case souhaitée:")
              if let read = readLine() {
                  if let x = Int(read) {
                      print("Votre choix, x:",idyokai)
                      coordXConforme = true
                  }
                  else{
                    print("Attention à votre choix de la coordonnée x n'est pas conforme. Un entier est attendu !")
                  }
              }
            }

            //On recupère la coordonnée y de la case vide souhaitée, on vérifie que le readLine est conforme.
            var coordYConforme : Bool = false
            while !coordYConforme{
              print("Entrer la coordonnée y de la case souhaitée:")
              if let read = readLine() {
                  if let y = Int(read) {
                      print("Votre choix, y:",idyokai)
                      coordYConforme = true
                  }
                  else{
                    print("Attention à votre choix de la coordonnée y. Un entier est attendu !")
                  }
              }
            }

            var position : PositionProtocol = Jeu.getPositionJeu(coord_x: x, coord_y: y) //A partir des coordonnées saisies par l'utilisateur, on retourne la position correspondante.
            if position != nil{
              if !est_Occupe(p: positon){ //On vérifie que la case choisie est bien libre pour éviter la triche
                joueur.parachuter(y: yokai, p: position)
                positionLibre = true //La position choisie est libre, on peut sortir du while
              }
              else{
                print("Attention, la case souhaitée est occupé !")
              }
            }

          }

        }
        else{
          print("Erreur: Veuillez respecter les options affichés.")
        }
    }
  }

  joueur = Jeu.getJoueurSuivant(joueur: joueur)
}

if Jeu.getJoueur(idjoueur: 1).estGagnant(){
  print("Félicitations Joueur 1 !")
}
else{
  print("Félicitations Joueur 2 !")
}
