// Tests pour Joueur.swift


  func TestinitJoueur(NumJoueur: Int)->Joueur

  func TestgetMain(joueur: Joueur)->yokaisIterator

  func TestmainEstVide(joueur: Joueur)->Bool

  func TestgetReserve(joueur: Joueur)->reserveIterator


  func TestreserveEstVide(joueur: Joueur)->Bool


  mutating func TestajoutReserve(j: Joueur, y :Yokai)->Joueur

  mutating func TestenleverReserve(j: Joueur, y: Yokai)->Joueur

  func TestestEnReserve(j: Joueur, y : Yokai)->Bool

  func TestestEnMain(j: Joueur, y: Yokai)->Bool

  mutating func Testparachuter(j: Joueur, y: Yokai, p: PositonProtocol)-> Joueur

  mutating func Testmanger(j: Joueur, y :Yokai)->Joueur

  mutating func TestajoutMain(j: Joueur, y : Yokai)->Joueur

  mutating func TestenleverMain(j: Joueur, y: Yokai)->Joueur

//Tests jeu.swift

  func TestinitJeu()->Jeu

  func TestgetJoueur(jeu: , idjoueur: Int)->Joueur

  func TestgetJoueurSuivant(jeu: Jeu, joueur: Joueur)->Joueur

  func TestmakeItPlateau(jeu: Jeu)->PositionPlateauIterator



//Tests Yokai.swift

  func TestinitYokai(p : Positon , id : Int)->Yokai

  func TestgetPosition(y: Yokai)->Positon?

  mutating func Testest_KodamaLocked(y: Yokai)->Bool

  mutating func TestsetSamourai(y: Yokai)->Yokai

  mutating func Testdeplacer(y: Yokai, p: Positon)->Yokai

  mutating func TestdeplacerReserve(y: Yokai)->Yokai

  func TestpeutAller(y: Yokai, coord_x: Int, coord_y: Int)->Bool

  func TestmakeItDeplacement(y: Yokai)->DeplacementIterator

//Tests Position.swift

func TestinitPosition(coord_x : Int, coord_y : Int)

func Testget_CoordX(p : Positon)-> Int

func Testget_CoordY(p : Positon)-> Int

func Testest_Occupe(p : Positon)->Int

mutating func TestchangeX(p : Positon, x : Int)-> Positon

mutating func TestchangeY(p : Positon, y : Int)-> Positon

mutating func Testoccuper(p : Positon)-> Positon

mutating func Testliberer(p : Positon)-> Positon

mutating func TestsetPosition(p1 : Positon, p2 : Positon)-> Positon
