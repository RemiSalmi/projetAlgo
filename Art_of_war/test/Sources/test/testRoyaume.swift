// Test sur le royaume

// fonction qui dois ajouter une carte dans le royaume
// cree un royaume
// cree une carte
// ajoute une carte au royaume
func testAjouterCarte() {
  var res : Royaume
	var carte : Carte
	res = Royaume()
  carte = Carte("Garde")
  res.ajouterCarte(carte)
  if carte == res.recupererCarte {
	   print("le test :'TestAjouterCarte' est reussi")
   }
   else{
	    print("le test :'TestAjouterCarte' est raté")
    }
}

// fonction qui prend une carte du royaume pour la mettre dans le champ de baille ou dans la main
// cree un royaume, une main et une carte
// ajoute une carte au royaume
// recupere cette carte du royaume et la place dans la main
// puis vérifie si il y a cette carte dans la main
func testRecupererCarte() {
	var roy : Royaume
	var mainj : Main
	var carte : Carte
	roy = Royaume()
	carte = Carte("Garde")
	mainj = Main()
	roy.ajouterCarte(carte)
	mainj.ajouterCarteMain(roy.recupererCarte(carte))
	if roy.tailleRoyaume() == 0 {
		print("le test :'TestRecupererCarte' est reussi")
	}
	else{
		print("le test :'TestRecupererCarte' est raté")
	}
}

// fonction qui donne la taille du royaume
// cree un royaume
// ajoute des cartes dans le royaume
// puis vérifie si la fonction renvoie bien le meme nombre que le nombres de cartes rajoutés
func testTailleRoyaume() {
	var res : Royaume
	var i : Int
	var carte : Carte
	res=Royaume()
	i=1
	carte = Carte("Garde")
	res.ajouterCarte(carte)
	if i != res.tailleRoyaume(){
		print("le test :'TestTailleRoyaume' est raté")
	}
	else{
		print("le test :'TestTailleRoyaume' est reussi")
	}
}

// fonction qui teste sur le royaume est vide
// cree un royaume et une carte
// ajoute la carte au royaume
// verifie si la fonction renvoie vide ou non
func testRoyaumeVide() {
	var roy : Royaume
	var carte : Carte
	roy = Royaume()
	carte = Carte("Garde")
	roy.ajouterCarte(carte)
	if roy.royaumeVide() {
		print("le test :'TestRoyaumeVide' est raté")
	}
	else{
		print("le test :'TestRoyaumeVide' est reussi")
	}
}
