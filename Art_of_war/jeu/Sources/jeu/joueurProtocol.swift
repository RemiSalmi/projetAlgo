public protocol joueurProtocol{

  associatedtype Joueur : joueurProtocol
  associatedtype Carte : carteProtocol
  associatedtype Main : mainProtocol
  associatedtype Pioche : piocheProtocol
  associatedtype ChampBataille : champBatailleProtocol
  associatedtype Royaume : royaumeProtocol

  // init : Int -> Joueur
  // Création d'un joueur
  // lorsqu'on crée un joueur on crée sa main (initailisée avec un roi n)
  // on crée un champs de bataille Vide
  // on crée un royaume vide
  init(n:Int)

  // roiCapture :  Joueur -> Bool
  // indique si le roi est capturé ou pas
  func roiCapture()->Bool

  // aGagne : Joueur-> Bool
  // indique si un joueur a gagné la partie ou pas
  // pour qu'un joueur gagne il faut :
  // - avoir capturé le roi adverse
  // ou si les 2 joueurs n'ont plus de pioche
  // - etre celui qui a le plus gros royaume
  // ou si le joueur n'a plus d'unités sur son champs de bataille et qu'il ne peut pas en mobiliser d'autres
  // alors il perd la partie
  func aGagne(j : Joueur)->Bool

  // roiCapture :  Joueur ->
  // met roiCapturé à True

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
  mutating func attaquer(posCarte:String,posCarteAd:String,cbAd: ChampBataille)->Int
}
