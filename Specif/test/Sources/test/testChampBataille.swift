// Test sur le ChampBataille

// fonction qui ragarde si le champ de bataille est vide
// cree un champ de bataille
func testEstVide(){
  var cb : ChampBataille
	cb = ChampBataille()
	if !cb.estVide() {
		print("le test :'TestEstVide' est raté")
	}
	else{
		print("le test :'TestEstVide' est reussi")
	}
}


// fonction qui regarde si une case d'un champ de bataille est vide
// cree un champ de bataille
// définie des positions
func testCaseVide(){
  var cdb : ChampBataille
  cdb = ChampBataille()
	if !cdb.caseVide("F1") {
		print("erreur testCaseVide : position non vide alors que normalement si")
	}
	else{
		print("test caseVide reussi")
	}
}
