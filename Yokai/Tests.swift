// Tests pour position.swift

func testPositionInit()->Int{
  do {
    try Position(coord_x: 3, coord_y: 4)    // Cas : coord_x et coord_y en dehors des cases du plateau de jeu (Voir spécifications de la fonction)
    print("Test échoué: Coordonnées hors plateau")

    /**
    try Position(coord_x: -3, coord_y: -4)  //Cas : coord_x et coord_y < 0
    print("Test échoué: Coordonnées négatives")
    **/
    
  }catch{
    print("Test réussit: Création d'une position")
  }
}
