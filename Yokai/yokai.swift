//Un yokai possède un type, des directions et une position.
//Il existe 5 types de yokais (Koropokkuru, Kitsune, Tanuki, Kodama, Kodama Locked, Kodoma Samurai)
//Le Kodama Locked est un Kodama qui ne peut pas se transformer (cela arrive si le joueur parachute son kodama dans la zone du joueur adverse)
//Chaque type de yokais possède des directions différentes allant de 1 à 8
// 1 :Haut, 2:Haut-Droite, 3:Droite, 4:Bas-Droite, 5:Bas, 6:Bas-Gauche, 7: Gauche, 8:Haut-Gauche
//Un yokai est en réserve lorsqu’il n’a pas de position , c’est à dire quand position == nil

protocol YokaiProtocol {
  associatedtype DeplacementIterator: IteratorProtocol

  var nom
  var position : Positon?
  var id : Int
  //init : String x Position x Int x Bool-> Yokai
  //Créer un Yokai
  //Pré : La position doit être une position valide et chaque Yokai a un id unique
  init(nom : String, p : Positon , id : Int)->Yokai


  //getPosition: Yokai -> (Position | Vide)
  //Renvoie la position du Yokai passé en paramètre
  func getPosition()->Positon?

  //est_KodamaLocked : Yokai -> Bool
  //Renvoie false si le yokai n'est pas un kodama Locked
  //Renvoie true si le yokai est un kodama locked
  func est_KodamaLocked()->Bool

  //setSamourai : Yokai -> Yokai
  //Pre : Le yokai passé en paramètre est un Kodama
  //Post : Le yokai retourné est un Kodama Samourai
  mutating func setSamourai()->Self

  //deplacer : Yokai x Position -> Yokai
  //Change la position du Yokai passé en parametre par la position passé en paramètre
  //Pré : La position passé en paramètre est une position valide (le yokai peut se deplacer sur cette position)
  //Post: libere la position precedement occupé et occupe la nouvelle
  mutating func deplacer(p: Positon)->Self

  //deplacerReserve : Yokai -> Yokai
  //Deplace le yokai du joueur dans la réserve
  //Post : L'attribut positon du yokai == nil
  mutating func deplacerReserve()->Self

  //peutAller : Yokai x Int x Int -> bool
  //Renvoie true si le Yokai peut aller sur la position passé en parametre (int x, int y) en fonction de ses déplacement
  //Pré :Vérifie que le déplacement laisse le Yokai à l'intérieur du plateau
  func peutAller(coord_x: Int, coord_y: Int)->Bool

  //makeItDeplacement: Yokai -> IteratorProtocol
  //Iterator sur les déplacement du Yokai passé en paramètre
  func makeItDeplacement()->DeplacementIterator

  //futurPosition : Yokai x String -> Position
  //Pré le string correspond au deplacmeent que le yokai va devoir efectuer il va devoir donc faire parti des deplacement possible par le Yokai (exemple : droite gauche ...)
  func futurPosition(deplacement : String)->Position
}
