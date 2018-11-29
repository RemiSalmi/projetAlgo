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

//get_CoordY : position -> Int
//Retourne la coord_y de la positon donnée paramètre

//est_Occupe : positon -> Bool
//Retourne true si l'attribut occuper = true, false sinon.



}
