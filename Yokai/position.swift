//Une position possède deux attributs de coordonnées x,y et un attribut occupé de type bool
protocol PositonProtocol{

var coord_x : Int
var coord_y : Int
//Attribut booleen, true si la position est occupé par un Yokai, false sinon
var occuper : Bool

//init: Int x Int -> PositonProtocol
//Creation d'une position à partir deux entiers
//Pre :  0 <= x <= 2 , 0 <= y <= 3
//Post : occuper = false
init(coord_x : Int, coord_y : Int)

//get_CoordX : PositonProtocol -> Int
//Retourne la coord_x de la positon donnée paramètre
func get_CoordX(p : PositonProtocol)-> Int

//get_CoordY : PositonProtocol -> Int
//Retourne la coord_y de la positon donnée paramètre
func get_CoordY(p : PositonProtocol)-> Int

//est_Occupe : PositonProtocol -> Bool
//Retourne True si la position donnée est occupé
func est_Occupe(p : PositonProtocol)->Int

//changeX : PositonProtocol  x Int -> PositonProtocol
// Change la valeur de coord_x de la positon passé en paramètre
//Pré : La valeur du int passé en paramètre doit correspondre a une coord_x valide
mutating func changeX(p : PositonProtocol, x : Int)-> PositonProtocol

//changeY : PositonProtocol  x Int -> PositonProtocol
// Change la valeur de coord_y de la positon passé en paramètre
//Pré : La valeur du int passé en paramètre doit correspondre a une coord_y valide
mutating func changeY(p : PositonProtocol, y : Int)-> PositonProtocol

//occuper : PositonProtocol -> PositonProtocol
//Passe la valeur de occuper de la position passé en paramètre à true
mutating func occuper(p : PositonProtocol)-> PositonProtocol

//liberer : PositonProtocol -> PositonProtocol
//Passe la valeur de occuper de la position passé en paramètre à false
mutating func liberer(p : PositonProtocol)-> PositonProtocol

//setPosition : PositonProtocol x PositonProtocol -> PositonProtocol
//change les valeurs coord_x et coord_y de la premiere position passe en parametre par celles de la seconde
mutating func setPosition(p1 : PositonProtocol, p2 : PositonProtocol)-> PositonProtocol

}
