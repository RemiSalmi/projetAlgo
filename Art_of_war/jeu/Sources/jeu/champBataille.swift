

public struct champBataille : champBatailleProtocol {

  var champ : [Carte?]
  //champ = [A1,A2,A3,F1,F2,F3]

  // init :  -> ChampBataille
  // création d’un ChampBataille vide
  init(){
    self.champ = [Carte?](repeating: nil, count: 6)
  }

  // estVide : champBataille -> Bool
  // Renvoie vrai si le champ de bataille ne contient aucune cartes
 	// Renvoie faux sinon
  func estVide()->Bool{
    return self.caseVide(pos:"A1") && self.caseVide(pos:"A2") && self.caseVide(pos:"A3") && self.caseVide(pos:"F1") && self.caseVide(pos:"F2") && self.caseVide(pos:"F3")
  }

  // caseVide : champBataille x String -> Bool
  // Renvoie vrai si une position du CB est vide
 	// Renvoie faux sinon
  func caseVide(pos:String)->Bool{
    var carte : Carte?
    var reponse : Bool = true
    switch pos{

    case "A1":
      carte = self.champ[0]
    case "A2":
      carte = self.champ[1]
    case "A3":
      carte = self.champ[2]
    case "F1":
      carte = self.champ[3]
    case "F2":
      carte = self.champ[4]
    case "F3":
      carte = self.champ[5]
    default:
      break;
    }

    if let carte = carte{
      reponse = false
    }
    return reponse
  }

  // positionCarte : champBataille x Carte -> String
  // Renvoie la position de la carte sur le champ de bataille
  // renvoie vide si la carte n'est pas présente sur le champ de bataille
  func positionCarte(c:Carte)->String?

  // CartePosition : champBataille x String -> Carte
  // Renvoie la carte de la position sur le champ de bataille
  // renvoie vide si pas de carte
  func CartePosition(pos:String)->Carte?{
    var carte : Carte?
    var reponse : Bool = true
    switch pos{

    case "A1":
      carte = self.champ[0]
    case "A2":
      carte = self.champ[1]
    case "A3":
      carte = self.champ[2]
    case "F1":
      carte = self.champ[3]
    case "F2":
      carte = self.champ[4]
    case "F3":
      carte = self.champ[5]
    default:
      break;
    }
    return carte
  }


}
