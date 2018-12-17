//fonctions de test de la main

// cree une main
// ajoute une carte
// si main vide alors testMainVide est raté
func testMainVide(){
	var mainj : Main
	mainj = Main(1)
	if mainj.mainVide() {
		print("le test :'testMainVide' est raté")}
	else{
		print("le test :'testMainVide' est reussi")
	}
}

// cree une main
// ajoute des cartes dans la main et verifie si ils a le meme nombre de carte ajouter que la valeur de tailleMain
func testTailleMain(){
	var mainj : Main
	mainj=Main(1)
	if 1 != mainj.tailleMain(){
		print("le test :'testTailleMain' est raté")
	}
	else{
		print("le test :'testTailleMain' est reussi")
	}

}

// cree une main
// ajoute une carte a la main
// si la main est vide test echoué
func testAjouterCarteMain(){
	var mainj : Main
	var carte : Carte
	mainj = Main()
	carte = Carte("Garde")
	mainj.ajouterCarte(carte)
	if mainj.mainVide() {
		print("le test :'TestAjouterCarteMain' est raté")
	}
	else{
		print("le test :'TestAjouterCarteMain' est reussi")
	}
}
