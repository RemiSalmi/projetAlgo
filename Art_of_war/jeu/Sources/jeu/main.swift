

public struct main : mainProtocol {
  var main = [Carte]()

  // init : Int -> Main
  // création d'une main, initialisée avec un Roi n
  // Pre : n doit être 1 ou 2
  // Post : on crée une carte "roi1" ou "roi2"
  init(n:Int){
    let typeRoi = "roi"+String(n)
    var roi = Carte(type: typeRoi)
    if var roi = roi {
      self.main.append(roi)
    }
  }
}
