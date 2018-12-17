// Test sur le Joueur

// fonction qui teste si le roi à été capturé ou non
// si le roi du j1 est dans le royaume du j2 il a été capturé
func testRoiCapture() {
  var roy : Royaume
	var carte : Carte
	var j1 : Joueur
	j1 = Joueur(1)
  	roy = Royaume()
	roy.ajouterCarte(j1.mainJoueur().supprimerCarte(1))
	j1.leRoiEstCapture()
	if RoiCapture() {
		print("le test :'TestRoiCapture' est reussi")
	}
	else{
		print("le test :'TestRoiCapture' est raté")
	}
  }

  // fonction qui donne la main du joueur
  // elle doit etre de type main
  func testMainJoueur() {
  	var j1 : Joueur
  	j1 = Joueur(1)
	if j1.mainJoueur().setCarte(1) == Carte("Roi1") {
		print("le test :'TestMainJoueur' est reussi")
	}
	else{
		print("le test :'TestMainJoueur' est raté")
	}
  }

  // fonction qui permet à un joueur d'attaquer
  // le joueur doit choisir une carte qui attaque dans son champ de bataille et choisir une carte à attaquer dans le champ de bataille de son adversaire
  // on suppose que le joueur peut attaquer
  // est ce que la carte est capturé ?
  // est ce que la carte est détruite ?
  // est ce que la carte à eu des dégats ?
func testAttaquer() {
	var carte2 : Carte
	var carte1b : Carte
	var carte3 : Carte
	var carte4 : Carte
	var carte5 : Carte
	var carte6 : Carte
	var j1 : Joueur
	var cdb : ChampBataille
	j1 = Joueur()
	cdb = ChampBataille()
  carte2 = Carte("soldat")
  carte1b = Carte("Garde")
  carte3 = Carte("Garde")
  carte4 = Carte("soldat")
  carte5 = Carte("Garde")
  carte6 = Carte("soldat")
  j1.champBatailleJoueur().placerCarte(carte2,"F1")
  cdb.placerCarte(carte1b,"F1")
  j1.mainJoueur().ajouterCarteMain(carte3)
  j1.mainJoueur().ajouterCarteMain(carte4)
  var res = j1.attaquer ("F1", "F1", cdb)
  if res == 2 {
	   print("le test :'TestAttaquerDégats' est reussi")
   }
   else{
	    print("le test :'TestAttaquerDégats' est raté")
    }
    j1.mainJoueur().ajouterCarteMain(carte5)
    carte1b.changerDegat(0)
    carte2.changerPosition()
    res = j1.attaquer ("F1", "F1", cdb)
    if res == -1 {
	     print("le test :'TestAttaquerCapturer' est reussi")
     }
     else{
	      print("le test :'TestAttaquerCapturer' est raté")
      }
      j1.mainJoueur().ajouterCarteMain(carte6)
      carte1b.changerDegat(0)
      carte2.changerPosition()
      res = j1.attaquer ("F1", "F1", cdb)
      if res == -2 {
	       print("le test :'TestAttaquer' est reussi")
       }
       else{
	        print("le test :'TestAttaquer' est raté")
        }
    }
