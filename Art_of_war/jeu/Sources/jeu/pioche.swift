public protocol piocheProtocol {

  associatedtype Carte : carteProtocol
  associatedtype Pioche : piocheProtocol

  // init : -> Pioche
  // création d’une pioche, initialisée avec 9 Soldats, 6 Gardes et 5 Archers
  //la pile pioche est vide
  init()

  // piocheVide : Pioche-> Bool
  // Vrai si piocheVide Faux sinon
  //si on ne peut plus créer de carte
  func piocheVide()->Bool

  // taillePioche : Pioche -> Int
  // nombre de carte présentes dans la pioche
  //nombre de carte que l'on peut créer
  // si la pioche est vide renvoyer 0
  // quand nbArcherPioche()==nbArchers() ou
  // quand nbSoldatPioche()==nbSoldats() ou
  // quand nbGuerrierPioche()==nbGuerriers()
  func taillePioche()->Int

  // nbArcher : Pioche -> Int
  // nombre total de carte archer que l'on peut créer
   func nbArchers()->Int

  // nbSoldat : Pioche -> Int
  // nombre total de carte soldat que l'on peut créer
  func nbSoldats()->Int

  // nbGarde : Pioche -> Int
  // nombre total de carte garde que l'on peut créer
  func nbGardes()->Int

  // nbArcherPioche : Pioche -> Int
  // nombre de carte archer déjà piochés
  func nbArcherPioche()->Int

  // nbSoldatPioche : Pioche -> Int
  // nombre de carte soldat déjà piochés
  func nbSoldatPioche()->Int

  // nbGardePioche : Pioche -> Int
  // nombre de carte garde déjà piochés
  func nbGardePioche()->Int

  // piocher : Pioche -> Carte
  // prend une carte sur le dessus de la pioche
  // Pre : la pioche n'est pas vide
  // Post : si la precondition n'est pas respectée renvoyer vide
  // Note 1 : piocher revient à créer une nouvelle Carte dont on choisit le type aléatoirement
  //          en fonction du nombre de chaque type restant
  // penser à incrementer le nombre de carte piochées en fonction du type
  @discardableResult
  mutating func piocher()->Carte
}
