//Une position possède deux attributs de coordonnées x,y et un attribut occupé de type bool
public protocol PositionProtocol{
associatedtype Position : PositionProtocol

var coord_x : Int
var coord_y : Int
var occuper : Bool //Attribut booleen, true si la position est occupé par un Yokai, false sinon

//init: Int x Int -> Position
//Creation d'une position à partir deux entiers
//Pre :  0 <= x <= 2 , 0 <= y <= 3
//Post : occuper = false
init(coord_x : Int, coord_y : Int)

//get_CoordX : Position -> Int
//Retourne la coord_x de la Position donnée paramètre
func get_CoordX()-> Int

//get_CoordY : Position -> Int
//Retourne la coord_y de la Position donnée paramètre
func get_CoordY()-> Int

//est_Occupe : Position -> Bool
//Retourne True si la position donnée est occupé
func est_Occupe()->Int

//changeX : Position  x Int -> Position
// Change la valeur de coord_x de la Position passé en paramètre
//Pré : La valeur du int passé en paramètre doit correspondre a une coord_x valide  0 <= x <= 2
mutating func changeX(x : Int)-> Self

//changeY : Position  x Int -> Position
// Change la valeur de coord_y de la Position passé en paramètre
//Pré : La valeur du int passé en paramètre doit correspondre a une coord_y valide 0 <= y <= 3
mutating func changeY(y : Int)-> Self

//occuper : Position -> Position
//Passe la valeur de occuper de la position passé en paramètre à true
mutating func occuper()-> Self

//liberer : Position -> Position
//Passe la valeur de occuper de la position passé en paramètre à false
mutating func liberer()-> Self

//setPosition : Position x Position -> Position
//change les valeurs coord_x et coord_y de la position par celles de la position passé en parametre
mutating func setPosition(newPos : Position)-> Self





}
