//Un yokai possède un type, des directions et une position.
//Il existe 5 types de yokais (Koropokkuru, Kitsune, Tanuki, Kodama, Kodama Locked, Kodoma Samurai)
//Le Kodama Locked est un Kodama qui ne peut pas se transformer (cela arrive si le joueur parachute son kodama dans la zone du joueur adverse)
//Chaque type de yokais possède des directions différentes allant de 1 à 8
// 1 :Haut, 2:Haut-Droite, 3:Droite, 4:Bas-Droite, 5:Bas, 6:Bas-Gauche, 7: Gauche, 8:Haut-Gauche
//Un yokai est en réserve lorsqu’il n’a pas de position , c’est à dire quand position == nil

protocol YokaiProtocol {
  associatedtype DeplacementIterator: IteratorProtocol

  var nom : String { get set }//Correspond au nom du Yokai
  var position : Positon? { get set }//Un attribut de type (Position | Vide)
  var id : Int { get set }//Chaque Yokai à un id unique

  //init : String x Position x Int -> Yokai
  //Créer un Yokai
  //Pré : La position doit être une position valide et chaque Yokai a un id unique
  init(nom : String, p : Positon , id : Int)


  //getPosition: Yokai -> (Position | Vide)
  //Renvoie la position du Yokai passé en paramètre
  //Pré: Le yokai peut-être dans la réserve ou sur le plateau
  //Post: Renvoie Vide si le yokai est en réserve. Renvoie une position si le yokai est sur le plateau.
  func getPosition()->Positon?

  //est_KodamaLocked : Yokai -> Bool
  //Renvoie false si le yokai n'est pas un kodama Locked
  //Renvoie true si le yokai est un kodama locked
  func est_KodamaLocked()->Bool

  //setKodamaLocked : Yokai -> Yokai
  //Pre: Le yokai passé en paramètre est un Kodama (qui a été parachuter dans la zone de l'adversaire)
  //Post: Modifie le yokai courant et renvoie un KodamaLocked qui ne peut pas se transformer en Kodama Samourai
  //La fonction modifie le nom et les déplacements du yokai, pour qu'il corresponde à un KodamaLocked
  mutating func setKodamaLocked()->Self

  //setSamourai : Yokai -> Yokai
  //Pre : Le yokai passé en paramètre est un Kodama
  //Post : Modifie le yokai courant et renvoie un Kodama Samourai
  //La fonction modifie le nom et les déplacements du yokai, pour qu'il corresponde à un Kodama Samourai
  mutating func setSamourai()->Self

  //setKodama : Yokai -> Yokai
  //Pre: Le yokai passé en paramètre est soit un Kodama Samourai, soit un KodamaLocked
  //Post: Modifie le yokai courant et renvoie un Kodama
  //La fonction modifie le nom et les déplacements du yokai, pour qu'il corresponde à un Kodama
  mutating func setKodama()->Self

  //deplacer : Yokai x Position -> Yokai
  //Change la position du Yokai par la position passé en paramètre
  //Pré : La position passé en paramètre est une position valide (le yokai peut se deplacer sur cette position)
  //      La position passé en paramètre est une des positions de l'attribut terrain du type Jeu
  //Post: Libère la position précedement occupé.La position passé en paramètre devient occupé
  mutating func deplacer(p: Positon)->Self

  //deplacerReserve : Yokai -> Yokai
  //Deplace le yokai qui était dans la main du joueur dans la réserve
  //Post : L'attribut positon du yokai == nil
  mutating func deplacerReserve()->Self

  //peutAller : Yokai x String -> Bool
  //Vérifie que le déplacement passé en paramètre appartient bien aux déplacements du Yokai.
  //Verifie que le déplcament laisse le Yokai à l'intérieur du plateau
  //Post: Renvoie true si les deux conditions précédentes sont respectée
  func peutAller(deplacement: String)->Bool

  //makeItDeplacement: Yokai -> IteratorProtocol
  //Crée un Iterator sur les déplacement du Yokai passé en paramètre
  func makeItDeplacement()->DeplacementIterator

  //futurPosition : Yokai x String -> Position
  //Pre: peutAller(d: deplacement) -> retourne true
  //Post: Retourne la future position du yokai correspondant au déplacement souhaitée
  //Post: La position retourné est une des positions de l'attribut terrain du type Jeu
  func futurPosition(deplacement: String)->Position
}
