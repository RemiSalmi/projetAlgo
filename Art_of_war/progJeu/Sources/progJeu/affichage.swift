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
  for carte in m {
    afficherCarte(c:carte)
  }
}

// afficherChampBataille : ChampBataille ->
// affichage d'un ChampBataille, sa collection de Carte
public func afficherChampBataille(cb:champBataille){
  for carte in cb {
    print("position de la carte : \(cb.positionCarte(c:carte))")
    afficherCarte(c:carte)
  }
}
