

public struct main : mainProtocol {

  public typealias Carte = carte
  public typealias Main = main
  var main: [Carte]

  // init : Int -> Main
  // création d'une main, initialisée avec un Roi n
  // Pre : n doit être 1 ou 2
  // Post : on crée une carte "roi1" ou "roi2"
  public init(n:Int){
    self.main = [Carte]()
    let typeRoi = "roi"+String(n)
    let roi = Carte(type: typeRoi)
    if let roi = roi {
      self.main.append(roi)
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
  public mutating func ajouterCarteMain(c:Carte)->Main{
    self.main.append(c)
    return self
  }

  // setCarte :  Main x Int -> Carte
  // renvoie la carte de la main à la position pos
  // Pre : la position doit etre entre 1 et tailleMain()
  //** Que faire si la pre condition n'est pas respectée ? **
  public func setCarte(pos:Int)->Carte{
    return self.main[pos]
  }

  // supprimerCarte :  Main x Int -> Carte
  // renvoie la carte de la main à la position pos et la supprime de la main
  // Pre : la position doit etre entre 1 et tailleMain()
  @discardableResult
  public mutating func supprimerCarte(pos:Int)->Carte{
    let carte = self.setCarte(pos: pos)
    self.main.remove(at: pos)
    return carte
  }

  public func makeIt()->IteratorMain{
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

  public func next()->Carte?{
    let carte : Carte
    guard self.courant < self.main.main.count else {
      return nil
    }
    carte = self.main.main[self.courant]
    self.courant = self.courant + 1
    return carte

  }
}
