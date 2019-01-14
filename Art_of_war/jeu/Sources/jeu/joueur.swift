public class joueur : joueurProtocol{

  public typealias Joueur = joueur
  public typealias Carte = carte
  public typealias Main = main
  public typealias Pioche = pioche
  public typealias ChampBataille = champBataille
  public typealias Royaume = royaume

  var champBataille : ChampBataille
  var main : Main
  var royaume : Royaume
  var pioche : Pioche
  //Booléen qui indique si le roi est capturé
  var roiCapturé : Bool
  // init : Int -> Joueur
  // Création d'un joueur
  // lorsqu'on crée un joueur on crée sa main (initailisée avec un roi n)
  // on crée un champs de bataille Vide
  // on crée un royaume vide
  public required init(n:Int){
    self.champBataille = ChampBataille()
    self.royaume = Royaume()
    self.main = Main(n : n)
    self.pioche = Pioche()
    self.roiCapturé = false
  }

  // roiCapture :  Joueur -> Bool
  // indique si le roi est capturé ou pas
  public func roiCapture()->Bool{
    var compteurRoi : Int = 0
    var itMain = self.mainJoueur().makeIterator()
    var itCb = self.champBatailleJoueur().makeIterator()
    while let carteM = itMain.next() {
      if (carteM.estDuType() == "roi1" || carteM.estDuType() == "roi2"){
        compteurRoi = compteurRoi + 1 //on compte le nombre de roi que possède le joueur dans sa main
      }
    }
    while let carteC = itCb.next() {
      if (carteC.estDuType() == "roi1" || carteC.estDuType() == "roi2"){
        compteurRoi = compteurRoi + 1 //on compte le nombre de roi que possède le joueur sur son champ de bataille
      }
    }

    return compteurRoi == 0 //On vérifie s'il n'a plus de roi
  }

  // aGagne : Joueur x Joueur -> Bool
  // indique si un joueur a gagné la partie ou pas
  // pour qu'un joueur gagne il faut :
  // - avoir capturé le roi adverse
  // ou si les 2 joueurs n'ont plus de pioche
  // - etre celui qui a le plus gros royaume
  // ou si le joueur n'a plus d'unités sur son champs de bataille et qu'il ne peut pas en mobiliser d'autres
  // alors il perd la partie
  public func aGagne(j : Joueur)->Bool{
    var res : Bool = true

    if j.roiCapture(){ //On vérifie si le roi est capturé
      res = false
    }

    if (self.piocheJoueur().piocheVide() && j.piocheJoueur().piocheVide()){ //On vérifie les pioches des joueurs
      if (self.royaumeJoueur().tailleRoyaume() < j.royaumeJoueur().tailleRoyaume()){
        res = false
      }
    }

    if (self.champBatailleJoueur().estVide() && self.mainJoueur().mainVide() && self.royaumeJoueur().royaumeVide()){ //On vérifie si sa main son royaume et sa pioche est vide
      res = false
    }


    return res


  }

  // roiCapture :  Joueur ->
  // met roiCapturé à True

  public func leRoiEstCapture(){
    self.roiCapturé = true
  }

  // mainJoueur :  Joueur -> Main
  // Main du joueur
  public func mainJoueur()->Main{
    return self.main
  }

  // royaumeJoueur :  Joueur -> Royaume
  // Royaume du joueur
  public func royaumeJoueur()->Royaume{
    return self.royaume
  }

  // piocheJoueur :  Joueur -> Pioche
  // Pioche du joueur
  public func piocheJoueur()->Pioche{
    return self.pioche
  }

  // champBatailleJoueur :  Joueur -> ChampBataille
  // champ de bataille du joueur
  public func champBatailleJoueur()->ChampBataille{
    return self.champBataille
  }

  // attaquer : Joueur x String x String x ChampBataille
  // Attaque une carte adverse à partir de sa position posCarteAd sur le champ de bataille adverse cbAd
  // la carte du joueur courant est donnée par sa position sur son champ de bataille
  //prendre en compte le cas du roi capturé
  // si l'attaque termine par la capture de la carte adverse return -1
  // si l'attaque termine par la destruction de la carte du joueur adverse return -2
  // si l'attaque termine par endommager de la carte du joueur adverse return le nombre de dégats causés

  public func attaquer(posCarte:String,posCarteAd:String,cbAd: ChampBataille)->Int{
    let erreur = -1000 //Code erreur
    let carteJoueur = self.champBatailleJoueur().CartePosition(pos : posCarte) //on récupère la carte du joueur
    var carteJoueurAd = cbAd.CartePosition(pos : posCarteAd) // on récupère la carte du joueur adverse
    if let carteJoueur = carteJoueur{
      if let carteJoueurAd = carteJoueurAd{
        if(cbAd.peutAttaquer(c:carteJoueur,pos:posCarteAd,cdb :self.champBatailleJoueur() )){//On vérifie que l'on puisse attauqer la carte du joueur adverse
          if(carteJoueur.valeurAttaque() == carteJoueurAd.valeurDefenseD()){ //si l'attaque du joueur courrant est égale à la défense adverse alors on capture sa carte
            self.royaume.ajouterCarte(c:carteJoueurAd)
            cbAd.supprimerCarte(c:carteJoueurAd)
            return -1
          }
          if(carteJoueur.valeurAttaque() > carteJoueurAd.valeurDefenseD()){ //Si l'attaque est suppérieur quer la défense de l'adversaire alors on la tue
            cbAd.supprimerCarte(c:carteJoueurAd)
            return -2
          }
          if (carteJoueur.valeurAttaque() < carteJoueurAd.valeurDefenseD()){ //Si l'attaque est inférieur à la défense adverse alors on ajoute des dégats à la carte adverse
            carteJoueurAd.changerDegat(nb : carteJoueurAd.degat()+carteJoueur.valeurAttaque())//On somme les anciens degats + les nouveau, car changerDegat modifie uniquement
            if (carteJoueurAd.valeurDefenseD() == carteJoueurAd.degat()){// On vérifie après avoir effectué les degats si les degats sont égaux à la defense de la carte alors on la capture
              self.royaume.ajouterCarte(c:carteJoueurAd)
              cbAd.supprimerCarte(c:carteJoueurAd)
              return -1
            }
            if(carteJoueurAd.degat() > carteJoueurAd.valeurDefenseD()){// On vérifie après avoir effectué les degats si les degats sont suppérieur à la defense de la carte alors on la tue
              cbAd.supprimerCarte(c:carteJoueurAd)
              return -2
            }
            return carteJoueur.valeurAttaque()
          }

        }
      }
    }
    return erreur //Comme il  n'y a pas de gestion des erreurs on doit renvoyer un code erreur en cas d'erreur.
  }

}
