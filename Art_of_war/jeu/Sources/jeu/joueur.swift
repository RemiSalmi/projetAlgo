public struct joueur : joueurProtocol{

    var champBataille : champBataille
    var main : main
    var royaume : royaume
    var pioche : pioche
    // init : Int -> Joueur
    // Création d'un joueur
    // lorsqu'on crée un joueur on crée sa main (initailisée avec un roi n)
    // on crée un champs de bataille Vide
    // on crée un royaume vide
    init(n:Int){
      self.champBataille = champBataille()
      self.royaume = royaume()
      self.main = main(n : n)
      self.pioche = pioche()
    }

    // roiCapture :  Joueur -> Bool
    // indique si le roi est capturé ou pas
    func roiCapture()->Bool{
      var compteurRoi : Int = 0
      var itMain = self.main.makeIt()
      while let carte = itMain.next() {
          if (carte.estDuType() == "roi1" || carte.estDuType() == "roi2"){
            compteurRoi = compteurRoi + 1
          }
      }
      return compteurRoi == 0
    }

    // aGagne : Joueur-> Bool
    // indique si un joueur a gagné la partie ou pas
    // pour qu'un joueur gagne il faut :
    // - avoir capturé le roi adverse
    // ou si les 2 joueurs n'ont plus de pioche
    // - etre celui qui a le plus gros royaume
    // ou si le joueur n'a plus d'unités sur son champs de bataille et qu'il ne peut pas en mobiliser d'autres
    // alors il perd la partie
    func aGagne()->Bool

    // roiCapture :  Joueur ->
    // met roiCapturé à True
    @discardableResult
    mutating func leRoiEstCapture()

    // mainJoueur :  Joueur -> Main
    // Main du joueur
    func mainJoueur()->Main

    // royaumeJoueur :  Joueur -> Royaume
    // Royaume du joueur
    func royaumeJoueur()->Royaume

    // piocheJoueur :  Joueur -> Pioche
    // Pioche du joueur
    func piocheJoueur()->Pioche

    // champBatailleJoueur :  Joueur -> ChampBataille
    // champ de bataille du joueur
    func champBatailleJoueur()->ChampBataille

    // attaquer : Joueur x String x String x ChampBataille
    // Attaque une carte adverse à partir de sa position posCarteAd sur le champ de bataille adverse cbAd
    // la carte du joueur courant est donnée par sa position sur son champ de bataille
    //prendre en compte le cas du roi capturé
    // si l'attaque termine par la capture de la carte adverse return -1
    // si l'attaque termine par la destruction de la carte du joueur courant return -2
    // si l'attaque termine par la destruction de la carte du joueur courant return le nombre de dégats causés
    @discardableResult
    mutating func attaquer(posCarte:String,posCarteAd:String,cbAd:ChampBataille)->Int
}