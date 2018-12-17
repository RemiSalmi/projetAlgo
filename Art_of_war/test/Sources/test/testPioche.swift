//fonctions de test de la pioche

// testPiocheVide :
// teste la fonction piocheVide()
func testPiocheVide(){
	var pi : Pioche
	pi = Pioche()

	if !pi.piocheVide() {
		print("le test :'testPiocheVide' est raté")}
	else{
		print("le test :'testPiocheVide' est reussi")
	}
}

// testTaillePioche :
// teste la fonction taillePioche()
func testTaillePioche(){
	var pi : Pioche
	pi=Pioche()
	var t=pi.taillePioche()
	pi.piocher()
	pi.piocher()

	if t != (pi.taillePioche()+2) {
		print("le test :'testTaillePioche' est raté")
	}
	else{
		print("le test :'testTaillePioche' est reussi")
	}
}
