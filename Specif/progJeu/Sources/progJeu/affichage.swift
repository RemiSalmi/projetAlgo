// afficherCarte : Carte ->
// affichage d'une Carte, ses propriétés
public func afficherCarte(c:Carte){
  print("type : \(c.estDuType())")
  print("dégats : \(c.estDuType())")
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
public func afficherMain(m:Main){
  for carte in m {
    afficherCarte(carte)
  }
}

// afficherChampBataille : ChampBataille ->
// affichage d'un ChampBataille, sa collection de Carte
public func afficherChampBataille(cb:ChampBataille){
  for carte in cb {
    print("position de la carte : \(cb.positionCarte(carte))")
    afficherCarte(carte)
  }
}
