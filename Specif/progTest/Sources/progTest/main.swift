import test
print("début phase de test")

print("test : Carte")
testValeurAttaque()
testValeurDefenseD()
testValeurDefenseO()
testEstDuType()

print("test : Joueur")
testRoiCapture()
testMainJoueur()
testAttaquer()

print("test : Main")
testMainVide()
testTailleMain()
testAjouterCarteMain()

print("test : Pioche")
testPiocheVide()
testTaillePioche()

print("test : Royaume")
testAjouterCarte()
testRecupererCarte()
testTailleRoyaume()
testRoyaumeVide()

print("test : ChampBataille")
testEstVide()
testCaseVide()

print("phase de test terminée")
