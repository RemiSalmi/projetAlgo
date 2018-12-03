// Tests pour Joueur.swift


  init(NumJoueur: Int)->Joueur

  func estGagnant(joueur: Joueur)->Bool

  func getMain(joueur: Joueur)->yokaisIterator

  func mainEstVide(joueur: Joueur)->Bool

  func getReserve(joueur: Joueur)->reserveIterator


  func reserveEstVide(joueur: Joueur)->Bool


  mutating func ajoutReserve(j: Joueur, y :Yokai)->Joueur

  mutating func enleverReserve(j: Joueur, y: Yokai)->Joueur

  func estEnReserve(j: Joueur, y : Yokai)->Bool

  func estEnMain(j: Joueur, y: Yokai)->Bool

  mutating func parachuter(j: Joueur, y: Yokai, p: PositonProtocol)-> Joueur

  mutating func manger(j: Joueur, y :Yokai)->Joueur

  mutating func ajoutMain(j: Joueur, y : Yokai)->Joueur

  mutating func enleverMain(j: Joueur, y: Yokai)->Joueur

//Tests jeu.swift

  init()->Jeu

  func getJoueur(jeu: , idjoueur: Int)->Joueur

  func getJoueurSuivant(jeu: Jeu, joueur: Joueur)->Joueur

  func makeItPlateau(jeu: Jeu)->PositionPlateauIterator

  init(p : Positon , id : Int)->Yokai

  func getPosition(y: Yokai)->Positon?

  mutating func est_KodamaLocked(y: Yokai)->Bool

  mutating func setSamourai(y: Yokai)->Yokai

  mutating func deplacer(y: Yokai, p: Positon)->Yokai

  mutating func deplacerReserve(y: Yokai)->Yokai

  func peutAller(y: Yokai, coord_x: Int, coord_y: Int)->Bool

  func makeItDeplacement(y: Yokai)->DeplacementIterator


//Tests Yokai.swift

  init(p : Positon , id : Int)->Yokai

  func getPosition(y: Yokai)->Positon?

  mutating func est_KodamaLocked(y: Yokai)->Bool

  mutating func setSamourai(y: Yokai)->Yokai

  mutating func deplacer(y: Yokai, p: Positon)->Yokai

  mutating func deplacerReserve(y: Yokai)->Yokai

  func peutAller(y: Yokai, coord_x: Int, coord_y: Int)->Bool

  func makeItDeplacement(y: Yokai)->DeplacementIterator

//Tests Position.swift

init(coord_x : Int, coord_y : Int)

func get_CoordX(p : Positon)-> Int

func get_CoordY(p : Positon)-> Int

func est_Occupe(p : Positon)->Int

mutating func changeX(p : Positon, x : Int)-> Positon

mutating func changeY(p : Positon, y : Int)-> Positon

mutating func occuper(p : Positon)-> Positon

mutating func liberer(p : Positon)-> Positon

mutating func setPosition(p1 : Positon, p2 : Positon)-> Positon
