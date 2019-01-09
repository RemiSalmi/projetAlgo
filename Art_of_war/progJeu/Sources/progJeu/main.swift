// Programme Principal
import jeu

// initialisation : création des joueurs
var j1 = joueur(n:1)
var j2 = joueur(n:2)

// mise en place du joueur 1


var cartePiocheJ1 = j1.piocheJoueur().piocher()
if let cartePiocheJ1  = cartePiocheJ1{

  // le joueur 1 pioche 3 cartes
  j1.mainJoueur().ajouterCarteMain(c : cartePiocheJ1)
  j1.mainJoueur().ajouterCarteMain(c : cartePiocheJ1)
  j1.mainJoueur().ajouterCarteMain(c : cartePiocheJ1)

  // le joueur 1 pioche une carte qui va directement dans son royaume
  j1.royaumeJoueur().ajouterCarte( c : cartePiocheJ1)
}



afficherMain(m:j1.mainJoueur())

// le joueur 1 choisi une carte de sa main à placer sur son champs de ChampBataille
let carte : Int

// le joueur entre un nombre correspondant a la place de la carte dans la main
carte = demanderCarteMainJoueur(tailleMain:j1.mainJoueur().tailleMain())

afficherChampBataille(cb:j1.champBatailleJoueur())

// le joueur indique à quel endroit il veut placer sa carte sur son champ de bataille
let pos : String

// le joueur entre une position correspondant à F1 F2 F3 A1 A2 A3
pos = demanderPosChampsBatailleJoueur(cb:j1.champBatailleJoueur())

// la carte est placée sur le champ de bataille du joueur 1
j1.champBatailleJoueur().placerCarte(c : j1.mainJoueur().setCarte( pos : carte), pos : pos)

// mise en place du joueur 2


var cartePiocheJ2 = j2.piocheJoueur().piocher()
if let cartePiocheJ2 = cartePiocheJ2{

  // le joueur 2 pioche 3 cartes
  j2.mainJoueur().ajouterCarteMain(c : cartePiocheJ2)
  j2.mainJoueur().ajouterCarteMain(c : cartePiocheJ2)
  j2.mainJoueur().ajouterCarteMain(c : cartePiocheJ2)

  // le joueur 2 pioche une carte qui va directement dans son royaume
  j2.royaumeJoueur().ajouterCarte(c : cartePiocheJ2)
}




afficherMain(m:j2.mainJoueur())
// le joueur 2 choisi une carte de sa main à placer sur son champs de ChampBataille

// le joueur entre un nombre correspondant a la place de la carte dans la main
carte = demanderCarteMainJoueur(tailleMain:j2.mainJoueur().tailleMain())

afficherChampBataille(cb:j2.champBatailleJoueur())

// le joueur indique à quel endroit il veut placer sa carte sur le champ de bataille

// le joueur entre une position correspondant à F1 F2 F3 A1 A2 A3
pos = demanderPosChampsBatailleJoueur(cb:j2.champBatailleJoueur())

// la carte est placée sur le champ de bataille du joueur
j2.champBatailleJoueur().placerCarte(c : j2.mainJoueur().setCarte( pos : carte), pos : pos)

// commencer partie
// on initialise le joueur qui est en train de jouer (ici joueur courant)
var joueurCourant : joueur
joueurCourant = j1

// on initialise le joueur qui ne joue pas (ici joueur adverse)
var joueurAdverse : joueur
joueurAdverse = j2

// tant qu'un roi n'est pas capturé ou que la pioche du joueur courant n'est pas vide ou (champ de bataille vide et main vide et royaume vide)
while !j1.roiCapture() && !j2.roiCapture() && !joueurCourant.piocheJoueur().piocheVide() && (!joueurCourant.mainJoueur().mainVide() || !joueurCourant.champBatailleJoueur().estVide() || !joueurCourant.royaumeJoueur().royaumeVide()){

  // phase de préparation

  // pioche une carte et l'ajoute à la main du joueur courant
  var piocheCourant = joueurCourant.piocheJoueur().piocher()
  if let piocheCourant = piocheCourant{
    joueurCourant.mainJoueur().ajouterCarteMain( c : piocheCourant)
  }


  // redresser toutes les cartes du champs de bataille du joueur courant
  for carte in joueurCourant.champBatailleJoueur(){
    if carte.estOffensive() {
      carte.changerPosition()
    }
  }

  // phase action
  var choix : Int
  choix = demanderJoueurAction()

  // 1=attaquer
  // 2=déployer une unité
  // sinon ne rien faire

  // si joueur decide d'attaquer
  if choix == 1 {
    var fin : Bool
    fin=false
    while !fin {

      // aficher le champs de bataille du joueur courant
      afficherChampBataille(cb : joueurCourant.champBatailleJoueur())

      let posCarte : String
      // le joueur entre une position correspondant a la place de la carte dans le champs de bataille
      posCarte = demanderPosChampsBatailleJoueur(cb : joueurCourant.champBatailleJoueur())
      // afficher le champs de bataille du joueur adverse
      afficherChampBataille(cb : joueurAdverse.champBatailleJoueur())

      let posCarteAd : String
      // le joueur entre une position correspondant a la place de la carte dans le champs de bataille
      posCarteAd = demanderPosChampsBatailleJoueur(cb : joueurAdverse.champBatailleJoueur())
      var res : Int
      res=joueurCourant.attaquer(posCarte : posCarte,posCarteAd : posCarteAd,cbAd : joueurAdverse.champBatailleJoueur())
      if res == -1 {
        print("vous avez capturé la carte adverse")
      }else if res == -2{
        print("la carte a été détruite")

      }else{
        print("la carte a été endommagé")
        print("nombre de dégats : \(res)")
      }

      fin=demanderJoueurFinAttaque()
    }

    // si joueur decide de deployer une unité (une carte sur le champs de bataille)
  }else if choix == 2 {
    afficherMain(m : joueurCourant.mainJoueur())
    // le joueur choisi une carte de sa main à placer sur le champs de ChampBataille

    // le joueur entre un nombre correspondant a la place de la carte dans la main
    carte = demanderCarteMainJoueur(tailleMain : joueurCourant.mainJoueur().tailleMain())

    // le joueur indique à quel endroit il veut placer sa carte sur le champ de bataille

    // le joueur entre une position correspondant à la place sur le champs le bataille
    pos = demanderPosChampsBatailleJoueur(cb : joueurCourant.champBatailleJoueur())

    // la carte est placée sur le champ de bataille du joueur
    //* Note dev : il faut récupérer la carte avec son numéro dans la main avant
    joueurCourant.champBatailleJoueur().placerCarte(c : carte, pos : pos)

    afficherChampBataille(cb : joueurCourant.champBatailleJoueur())
  }
  // sinon  ne rien faire

  // remise à 0 des dégats
  for carte in joueurCourant.champBatailleJoueur(){
    carte.changerDegat(nb : 0)
  }

  // phase de developpement
  // choix == 0 le joueur veut poser une carte
  // choix == 1 le joueur ne veut pas poser de carte

  choix = demanderJoueurDevelopper()
  // tant que le joueur a 6 cartes ou plus dans sa main il doit en enlever
  // sinon tant qu'il veut on continue jusqu'à n'avoir plus qu'une carte dans sa main
  while joueurCourant.mainJoueur().tailleMain()>=6 || choix==0 || joueurCourant.mainJoueur().tailleMain()>1{
    afficherMain(m : joueurCourant.mainJoueur())
    // le joueur choisi une carte de sa main à placer dans le royaume

    // le joueur entre un nombre correspondant a la place de la carte dans la main
    carte = demanderCarteMainJoueur(tailleMain : joueurCourant.mainJoueur().tailleMain())
    // la carte est ajoutée au royaume
    //* Note dev : il faut récupérer la carte avec son numéro dans la main avant
    joueurCourant.royaumeJoueur().ajouterCarte(c : carte)

    choix = demanderJoueurDevelopper()

  }

  // inverse les roles de joueurs
  var j : joueur
  j=joueurCourant
  joueurCourant=joueurAdverse
  joueurAdverse=j

}

if j1.aGagne(j : j2) {
  print("bravo j1 vous avez gagné !")
}else {
  print("bravo j2 vous avez gagné !")
}

print("fin de partie")
