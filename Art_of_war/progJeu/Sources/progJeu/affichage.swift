import jeu

// afficherCarte : Carte ->
// affichage d'une Carte, ses propriétés
public func afficherCarte(c:carte){
  print("type : \(c.estDuType())")
  print("dégats : \(c.degat())")
  if c.estOffensive(){
    print("défense offensive : \(c.valeurDefenseO())")
  }
  else{
    print("défense défensive : \(c.valeurDefenseD())")
  }
  print("attaque : \(c.valeurAttaque())")
}

// afficherMain : Main ->
// affichage d'une Main, sa collection de Carte
public func afficherMain(m:main){
  print(" --- Affichage de votre main ---")
  var IteratorMain = m.makeIterator()
  while let carte = IteratorMain.next(){
    afficherCarte(c:carte)
    print("  ")
  }
}

// afficherChampBataille : ChampBataille ->
// affichage d'un ChampBataille, sa collection de Carte
public func afficherChampBataille(cb:champBataille){
  var IteratorChampBataille = cb.makeIterator()
  while let carte = IteratorChampBataille.next(){
    if let position_carte = cb.positionCarte(c:carte){
      print("Position de la carte : ",position_carte)
    }
    afficherCarte(c:carte)
    print("  ")
  }
}
