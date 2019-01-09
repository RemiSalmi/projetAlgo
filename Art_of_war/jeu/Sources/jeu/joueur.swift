public struct joueur : joueurProtocol{

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
  var roiCapturé : Bool
  // init : Int -> Joueur
  // Création d'un joueur
  // lorsqu'on crée un joueur on crée sa main (initailisée avec un roi n)
  // on crée un champs de bataille Vide
  // on crée un royaume vide
  public init(n:Int){
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
    let itMain = self.mainJoueur().makeIt()
    let itCb = self.champBatailleJoueur().makeIt()
    while let carteM = itMain.next() {
      if (carteM.estDuType() == "roi1" || carteM.estDuType() == "roi2"){
        compteurRoi = compteurRoi + 1
      }
    }
    while let carteC = itCb.next() {
      if (carteC.estDuType() == "roi1" || carteC.estDuType() == "roi2"){
        compteurRoi = compteurRoi + 1
      }
    }

    return compteurRoi == 0
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

    if self.roiCapture(){
      res = false
    }

    if (self.piocheJoueur().piocheVide() && j.piocheJoueur().piocheVide()){
      if (self.royaumeJoueur().tailleRoyaume() < j.royaumeJoueur().tailleRoyaume()){
        res = false
      }
    }

    if (self.champBatailleJoueur().estVide() && self.mainJoueur().mainVide() && self.royaumeJoueur().royaumeVide()){
      res = false
    }


    return res


  }

  // roiCapture :  Joueur ->
  // met roiCapturé à True
  @discardableResult
  public mutating func leRoiEstCapture(){
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
  @discardableResult
  public mutating func attaquer(posCarte:String,posCarteAd:String,cbAd: inout ChampBataille)->Int{

    let carteJoueur = self.champBatailleJoueur().CartePosition(pos : posCarte)
    let carteJoueurAd = cbAd.CartePosition(pos : posCarteAd)
    if let carteJoueur = carteJoueur{
      if let carteJoueurAd = carteJoueurAd{
        if(self.champBatailleJoueur().peutAttaquer(c:carteJoueur,pos:posCarteAd,cdb :self.champBatailleJoueur() )){
          if(carteJoueur.valeurAttaque() == carteJoueurAd.valeurDefenseD()){
            self.royaume.ajouterCarte(c:carteJoueurAd)
            cbAd.supprimerCarte(c:carteJoueurAd)
            return -1
          }
          if(carteJoueur.valeurAttaque() > carteJoueurAd.valeurDefenseD()){
            cbAd.supprimerCarte(c:carteJoueurAd)
            return -2
          }
          if (carteJoueur.valeurAttaque() < carteJoueurAd.valeurDefenseD()){
            cbAd.CartePosition(pos : posCarteAd).changerDegat(nb : carteJoueur.valeurAttaque())
            return carteJoueur.valeurAttaque()
          }

        }
      }
    }

  }
}
