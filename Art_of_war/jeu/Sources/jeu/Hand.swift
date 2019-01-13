
//Création d'une class pour implémenter le type main de mainProtocol
public class main : mainProtocol {

  public typealias Carte = carte
  public typealias Main = main
  var main: [Carte] //L'attribut main est une liste de carte

  // init : Int -> Main
  // création d'une main, initialisée avec un Roi n
  // Pre : n doit être 1 ou 2
  // Post : on crée une carte "roi1" ou "roi2"
  //Note developpeurs : Aucune indication sur quoi faire si la pre-condition n'est pas respectée.
  //Proposition dev: Il faudrait changer la fonction en init?
  //                Si la pre-condition n'est pas respecté on renvoie vide, la création échoue
  public required init(n:Int){
    self.main = [Carte]() //On initialise notre liste de carte, elle est vide
    let typeRoi = "roi"+String(n) //Suivant le n passé en paramètre (1 ou 2) on concatène avec "roi" pour la création d'un roi1 ou roi2
    let roi = Carte(type: typeRoi) //Création d'un roi
    if let roi = roi {  //On vérifie que ce n'est pas nil, que la création c'est passé correctement
      self.main.append(roi) //On ajoute notre roi à notre main
    }
  }

  // mainVide : Main -> Bool
  // indique si la main est vide ou pas
  // Post : retourne True si main vide false sinon
  public func mainVide()->Bool{
    return self.main.isEmpty
  }

  // tailleMain : Main-> Int
  // indique le nombre de cartes dans la main
  // Post : si la main est vide renvoyer 0
  public func tailleMain()->Int{
    var taille : Int = 0
    if !self.mainVide() {
      taille = self.main.count
    }
    return taille
  }

  // ajouterCarteMain :  Main x Carte -> Main
  // ajoute UNE seule carte dans une main
  // Pre : la carte doit provenir de la pioche ???
  // Post :tailleMain=tailleMain+1
  @discardableResult
  public func ajouterCarteMain(c:Carte)->Main{
    self.main.append(c)
    return self
  }

  // setCarte :  Main x Int -> Carte
  // renvoie la carte de la main à la position pos
  // Pre : la position doit etre entre 1 et tailleMain()
  //Note developpeurs : Aucune indication sur quoi faire si la pre-condition n'est pas respectée.
  //Proposition dev: Il faudrait changer la fonction pour renvoyer Carte?
  //                Si la pre-condition n'est pas respecté on renvoie vide
  public func setCarte(pos:Int)->Carte{
    return self.main[pos-1] //La carte qui à pour pos=1 est la carte qui se trouve à l'indice 0 de notre attribut main, il faut donc décrémenter de 1
  }

  // supprimerCarte :  Main x Int -> Carte
  // renvoie la carte de la main à la position pos et la supprime de la main
  // Pre : la position doit etre entre 1 et tailleMain()
  //Note developpeurs : Aucune indication sur quoi faire si la pre-condition n'est pas respectée.
  //Proposition dev: Il faudrait changer la fonction pour renvoyer Carte? Si la pre-condition n'est pas respecté on renvoie vide
  @discardableResult
  public func supprimerCarte(pos:Int)->Carte{
    let carte = self.setCarte(pos: pos) //On récupère la carte que l'on va supprimer
    self.main.remove(at: pos-1) //La carte qui à pour pos=1 est la carte qui se trouve à l'indice 0 de notre attribut main, il faut donc décrémenter de 1
    return carte
  }

  public func makeIterator()->IteratorMain{
    return IteratorMain(self)
  }
}

public struct IteratorMain : IteratorMainProtocol{
  public typealias Carte = carte
  public typealias Main = main
  private let main : Main
  private var courant : Int = 0
  fileprivate init(_ m: Main){
    self.main = m
  }

  public mutating func next()->Carte?{
    let carte : Carte
    guard self.courant < self.main.main.count else {
      return nil
    }
    carte = self.main.main[self.courant]
    self.courant = self.courant + 1
    return carte

  }
}
