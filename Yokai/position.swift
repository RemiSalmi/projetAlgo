//Une position possède deux attributs de coordonnées x,y et un attribut occupé de type bool
protocol PositionProtocol{

var coord_x : Int
var coord_y : Int
//Attribut booleen, true si la position est occupé par un Yokai, false sinon
var occuper : Bool

//init: Int x Int -> Positon
//Creation d'une position à partir deux entiers
//Pre :  0 <= x <= 2 , 0 <= y <= 3
//Post : occuper = false
init(coord_x : Int, coord_y : Int)

//get_CoordX : Positon -> Int
//Retourne la coord_x de la positon donnée paramètre
func get_CoordX(p : Positon)-> Int

//get_CoordY : Positon -> Int
//Retourne la coord_y de la positon donnée paramètre
func get_CoordY(p : Positon)-> Int

//est_Occupe : Positon -> Bool
//Retourne True si la position donnée est occupé
func est_Occupe(p : Positon)->Int

//changeX : Positon  x Int -> Positon
// Change la valeur de coord_x de la positon passé en paramètre
//Pré : La valeur du int passé en paramètre doit correspondre a une coord_x valide
mutating func changeX(p : Positon, x : Int)-> Self

//changeY : Positon  x Int -> Positon
// Change la valeur de coord_y de la positon passé en paramètre
//Pré : La valeur du int passé en paramètre doit correspondre a une coord_y valide
mutating func changeY(p : Positon, y : Int)-> Self

//occuper : Positon -> Positon
//Passe la valeur de occuper de la position passé en paramètre à true
mutating func occuper(p : Positon)-> Self

//liberer : Positon -> Positon
//Passe la valeur de occuper de la position passé en paramètre à false
mutating func liberer(p : Positon)-> Self

//setPosition : Positon x Positon -> Positon
//change les valeurs coord_x et coord_y de la premiere position passe en parametre par celles de la seconde
mutating func setPosition(p1 : Positon, p2 : Positon)-> Self

}
