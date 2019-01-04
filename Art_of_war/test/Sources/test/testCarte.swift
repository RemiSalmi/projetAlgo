//fonctions de test de la carte

func testValeurAttaque(){
	var carte1 : Carte
	carte1 = Carte("Garde")
	if carte1.valeurAttaque() == 1{
		print("le test :'testValeurAttaqueGarde' est reussi")
	}
	else{
		print("le test :'testValeurAttaqueGarde' est raté")
	}
	var mainj : Main
	mainj = Main(1)
	var carte2 : Carte
	carte2 = Carte("Soldat")
	if carte2.valeurAttaque() == 1{
		print("le test :'testValeurAttaqueSoldat' est reussi")
	}
	else{
		print("le test :'testValeurAttaqueSoldat' est raté")
	}
	var carte3 : Carte
	carte3 = Carte("Archer")
	if carte3.valeurAttaque() == 1{
		print("le test :'testValeurAttaqueArcher' est reussi")
	}
	else{
		print("le test :'testValeurAttaqueArcher' est raté")
	}
	var carte4 : Carte
	carte4 = Carte("Roi1")
	if carte4.valeurAttaque() == 1{
		print("le test :'testValeurAttaqueRoi1' est reussi")
	}
	else
	{
		print("le test :'testValeurAttaqueRoi1' est raté")
	}
	var carte5 : Carte
	carte5 = Carte("Roi2")
	if carte5.valeurAttaque() == 1{
		print("le test :'testValeurAttaqueRoi2' est reussi")
	}
	else
	{
		print("le test :'testValeurAttaqueRoi2' est raté")
	}
}

func testValeurDefenseD(){
	var carte1 : Carte
	carte1 = Carte("Garde")
	if carte1.valeurDefenseD() == 3{
		print("le test :'testValeurDefenseDGarde' est reussi")
	}
	else{
		print("le test :'testValeurDefenseDGarde' est raté")
	}
	var carte2 : Carte
	carte2 = Carte("Soldat")
	if carte2.valeurDefenseD() == 2{
		print("le test :'testValeurDefenseDSoldat' est reussi")
	}
	else{
		print("le test :'testValeurDefenseDSoldat' est raté")
	}
	var carte3 : Carte
	carte3 = Carte("Archer")
	if carte3.valeurDefenseD() == 2{
		print("le test :'testValeurDefenseDArcher' est reussi")
	}
	else{
		print("le test :'testValeurDefenseDArcher' est raté")
	}
	var carte4 : Carte
	carte4 = Carte("Roi1")
	if carte4.valeurDefenseD() == 4{
		print("le test :'testValeurDefenseDRoi1' est reussi")
	}
	else
	{
		print("le test :'testValeurDefenseDRoi1' est raté")
	}
	var carte5 : Carte
	carte5 = Carte("Roi2")
	if carte5.valeurDefenseD() == 5{
		print("le test :'testValeurDefenseDRoi2' est reussi")
	}
	else{
		print("le test :'testValeurDefenseDRoi2' est raté")
	}
}

func testValeurDefenseO(){
	var carte1 : Carte
	carte1 = Carte("Garde")
	if carte1.valeurDefenseO() == 2{
		print("le test :'testValeurDefenseOGarde' est reussi")
	}
	else{
		print("le test :'testValeurDefenseOGarde' est raté")
	}
	var carte2 : Carte
	carte2 = Carte("Soldat")
	if carte2.valeurDefenseO() == 1{
		print("le test :'testValeurDefenseOSoldat' est reussi")
	}
	else{
		print("le test :'testValeurDefenseOSoldat' est raté")
	}
	var carte3 : Carte
	carte3 = Carte("Archer")
	if carte3.valeurDefenseO() == 1{
		print("le test :'testValeurDefenseOArcher' est reussi")
	}
	else{
		print("le test :'testValeurDefenseOArcher' est raté")
	}
	var carte4 : Carte
	carte4 = Carte("Roi1")
	if carte4.valeurDefenseO() == 4{
		print("le test :'testValeurDefenseORoi1' est reussi")
	}
	else{
		print("le test :'testValeurDefenseORoi1' est raté")
	}
	var carte5 : Carte
	carte5 = Carte("Roi2")
	if carte5.valeurDefenseO() == 4{
		print("le test :'testValeurDefenseORoi2' est reussi")
	}
	else{
		print("le test :'testValeurDefenseORoi2' est raté")
	}
}

func testEstDuType(){
	var carte1 : Carte
	carte1 = Carte("Garde")
	if carte1.estDuType() == "Garde"{
		print("le test :'testEstDuTypeGarde' est reussi")
	}
	else{
		print("le test :'testEstDuTypeGarde' est raté")
	}
	var carte2 : Carte
	carte2 = Carte("Soldat")
	if carte2.estDuType() == "Soldat"{
		print("le test :'testValeurDefenseOSoldat' est reussi")
	}
	else{
		print("le test :'testValeurDefenseOSoldat' est raté")
	}
	var carte3 : Carte
	carte3 = Carte("Archer")
	if carte3.estDuType() == "Archer"{
		print("le test :'testValeurDefenseOArcher' est reussi")
	}
	else{
		print("le test :'testValeurDefenseOArcher' est raté")
	}
	var carte4 : Carte
	carte4 = Carte("Roi1")
	if carte4.estDuType() == "Roi1"{
		print("le test :'testValeurDefenseORoi1' est reussi")
	}
	else{
		print("le test :'testValeurDefenseORoi1' est raté")
	}
	var carte5 : Carte
	carte5 = Carte("Roi2")
	if carte5.estDuType() == "Roi2"{
		print("le test :'testValeurDefenseORoi2' est reussi")
	}
	else{
		print("le test :'testValeurDefenseORoi2' est raté")
	}
}
