//Un yokai possède un type des directions et une position.
//Il existe 5 types de yokais (Koropokkuru, Kitsune, Tanuki, Kodama, Kodoma Samurai)
//Chaque type de yokais possède des directions différentes allant de 1 à 8
//Un yokai est en réserve lorsqu’il n’a pas de position , c’est à dire quand position == nil

protocol yokaiProtocol {

  var nom : String
  var position : Position
  var id : Int
  var isSamourai : Bool

  //init : String x Position x Int x Bool-> Yokai
  //Créer un Yokai
  //Pré : La position doit être une position valide
  // id = 1 ou id = 2 car il y a seulement 2 occurence de chaque Yokai (exemple 2 Kodama)
  //isSamourai commence toujours à false car un Yokai ne peut pas samourai lorsqu'il est créé
  init(nom : String, P : Position, id : Int)->Yokai

  //est_Samourai : Yokai -> Bool
  //Renvoie true si le Yokai passé en paramètre a sa valaur isSamourai à True
  mutating func est_Samourai(y : Yokai)->Bool

  //setSamourai : Yokai x Bool -> Yokai
  //Change la valeur de isSamourai du Yokai passé en paramètre par le Bool passé en paramètre
  mutating func setSamourai(y : Yokai, b : Bool)->Yokai

  //deplacer : Yokai x Position -> Yokai
  //Change la position du Yokai passé en parametre par la position passé en paramètre
  //Pré : La position passé en paramètre est une position valide
  mutating func deplacer(y : Yokai, p : Position)-> Yokai



}
