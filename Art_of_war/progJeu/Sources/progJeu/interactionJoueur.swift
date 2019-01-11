import jeu
//fonction d'interaction avec le joueur (input)

// demanderCarteMainJoueur :  -> Int
// demande quelle carte le joueur veut prendre de sa main
// Post : le joueur doit indiquer la place de la carte dans sa main
// Post : tant que le joueur n'a pas donné un chiffre correct on lui redemande
// Note : cette fonction convertie la chaine de caractere entrée par le joueur en entier
public func demanderCarteMainJoueur(tailleMain:Int)->Int{
  let Erreur : Int = -100 //Code erreur
  print("entrez le numero de la carte 1,2,...,\(tailleMain)")
  if let num = try readLine(){
    if let n=Int(num){
    if (n>0 && n <= tailleMain){
      return n
    }
    else{
      return demanderCarteMainJoueur(tailleMain:tailleMain)
    }
  }
}
  else{
    print("vous devez entrez le numero de la carte 1,2,...,\(tailleMain) Réessayez")
    return demanderCarteMainJoueur(tailleMain:tailleMain)
  }
  return Erreur
}

// demanderJoueurAction :  -> Int
// demande quelle action le joueur veut effectuer
// 1=attaquer
// 2=déployer une unité
// 0 ne rien faire
// Post : tant que le joueur n'a pas donné un chiffre correct on lui redemande
// Note : cette fonction convertie la chaine de caractere entrée par le joueur en entier
public func demanderJoueurAction()->Int{
  let Erreur : Int = -100 //Code erreur
  print("entrez le numero de l'action a effectuer")
  print("entrez 0 pour ne rien faire")
  print("entrez 1 pour attaquer")
  print("entrez 2 pour deployer une unite")
  if let num = try readLine(){
    if let n=Int(num){
      if n==0 || n==1 || n==2{
        return n
      }
    }
    else{
      return demanderJoueurAction()
    }
  }
  else{
    print("vous devez entrez un numero 0, 1 ou 2 Réessayez")
    return demanderJoueurAction()
  }
  return Erreur
}

// demanderPosChampsBatailleJoueur :  -> String
// demande sur quelle position le joueur veut mettre sa carte
// Post :le joueur doit indiquer la place de la carte dans sa main
// Post : tant que le joueur n'a pas donné un chiffre et une lettre correcte on lui redemande
public func demanderPosChampsBatailleJoueur(cb:champBataille)->String{
  print("Entrez la position de la carte que vous souhaitez sur votre champ de bataille")
  print("Votre réponse doit être de la forme F1 F2 F3")
  if let pos = try readLine(){
    if (pos=="F1" || pos=="F2" || pos=="F3"){
      return pos
    }
    else{
      return demanderPosChampsBatailleJoueur(cb:cb)
    }
  }
  else{
    print("erreur entrée Réessayez")
    return demanderPosChampsBatailleJoueur(cb:cb)
  }
}

// Note dev : Ajout de cette fonction
// demanderPosAttaqueChampsBatailleJoueur :  -> String
// Post :le joueur doit indiquer la place de la carte avec laquelle il souhaite attaquer et celle qu'il veut attaquer
// Post : tant que le joueur n'a pas donné un chiffre et une lettre correcte on lui redemande
public func demanderPosAttaqueChampsBatailleJoueur(cb:champBataille)->String{
  print("Votre réponse doit être de la forme F1 F2 F3 A1 A2 A3")
  if let pos = try readLine(){
    if (pos=="F1" || pos=="F2" || pos=="F3" || pos=="A1" || pos=="A2" || pos=="A3"){
      if cb.caseVide(pos:pos){
        print("La case de votre choix est vide")
        return demanderPosAttaqueChampsBatailleJoueur(cb:cb)
      }
      return pos
    }
    else{
      return demanderPosAttaqueChampsBatailleJoueur(cb:cb)
    }
  }
  else{
    print("erreur entrée Réessayez")
    return demanderPosAttaqueChampsBatailleJoueur(cb:cb)
  }
}

// demanderJoueurDevelopper :  -> Int
// demande si le joueur veut poser une carte de sa main dans le royaume
// Post : le joueur doit indiquer la place de la carte dans sa main
// choix == 0 le joueur veut poser une carte
// choix == 1 le joueur ne veut pas poser de carte
// Post : tant que le joueur n'a pas donné un chiffre correct on lui redemande
// Note : cette fonction convertie la chaine de caractere entrée par le joueur en entier
public func demanderJoueurDevelopper()->Int{
  let Erreur : Int = -100 //Code erreur
  print("si vous souhaitez developper (deposer une carte de votre main votre royaume) ")
  print("tapez 0")
  print("si vous ne voulez pas developper")
  print("tapez 1")
  if let pos = try readLine(){
    if let n=Int(pos){
    if (n==0 || n==1){
      return n
    }
    }
    else{
      return demanderJoueurDevelopper()
    }
  }
  else{
    print("erreur Réessayez")
    return demanderJoueurDevelopper()
  }
  return Erreur
}

// demanderJoueurFinAttaque :  -> Bool
// demande si le joueur a fini d'attaquer
// Post : le joueur doit indiquer si il a fini d'attaquer
// choix == 0 le joueur a fini
// choix == 1 le joueur veux attaquer
func demanderJoueurFinAttaque()->Bool{
  print("- Si vous ne voulez pas attaquer : tapez 0")
  print("- Si vous souhaitez attaquer : tapez 1")

  if let pos = try readLine(){
    if (pos=="0" || pos=="1"){
      if pos=="0"{
        return true
      }else{
        return false
      }
    }
    else{
      return demanderJoueurFinAttaque()
    }
  }
  else{
    print("erreur Réessayez")
    return demanderJoueurFinAttaque()
  }
}
