//Une position possède deux attributs de coordonnées x,y et un attribut occupé de type boo
protocol positonProtocol{

var coord_x : Int
var coord_y : Int
//Attribut booleen, true si la position est occupé par un Yokai, false sinon
var occuper : Bool



//init: Int x Int -> position
//Creation d'une position à partir deux entiers
//Pre :  0 <= x <= 2 , 0 <= y <= 3
//Post : occuper = false
init(coord_x : Int, coord_y : Int)


//get_CoordX : position -> Int
//Retourne la coord_x de la positon donnée paramètre
func get_CoordX(p : Position)-> Int

//get_CoordY : position -> Int
//Retourne la coord_y de la positon donnée paramètre
func get_CoordY(p : Position)-> Int

//est_Occupe : positon -> Bool
//Retourne True si la position donnée est occupé
func est_Occupe(p : Position)->Int

//changeX : Position  x Int -> position
//Retourne Change la valeur de coord_x de la positon passé en paramètre
//Pré : La valeur du int passé en paramètre doit correspondre a une coord_x valide
mutating func changeX(p : Position, x : Int)-> Position

//changeY : Position  x Int -> position
//Retourne Change la valeur de coord_y de la positon passé en paramètre
//Pré : La valeur du int passé en paramètre doit correspondre a une coord_y valide
mutating func changeY(p : Position, y : Int)-> Position

//occuper : Position -> Position
//Passe la valeur de occuper de la position passé en paramètre à true
mutating func occuper(p : Position)-> Position

//liberer : Position -> Position
//Passe la valeur de occuper de la position passé en paramètre à false
mutating func liberer(p : Position)-> Position

}
