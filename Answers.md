# Answers Roussel Arnaud

# 2-app-basics
    ## Exercice 1
        1,1 Il manqué une boucle for sur le array 

    ## Exercice 2
        2,1 Il y a un 
            - rajout d'une fonction pour rajouter un loot dans le array
            - rajout d'un bouton tout en haut de la view
            - correction du foreach
        2,2 On utilise un ForEach pour afficher à la volé tous les éléments de la liste.
            Il faut separé le Button du ForEach car ce sont différant élément de la view
    ## Exercice 3
        3,1 Le code ne fonctionne pas a cause d'un probléme de scope car le view n'as pas accès au array
        3,3 En rajoutant l'annotaion @state et un scope en private la view a non seulement accés mais peut aussi modifier la variable
# 4-Ajout-Item
    ## Exercice 1
        1,1 Cela ne marche pas car le array dans la class est immutable

    ## Exercice 2
        2,2 cela fonctionne a nouveau car on injecte directement des strings dans le array qui est devenu modifiable et non en dur
        2,3 on utilise le @ObservedObject car il attend une booleene et le @State est pour les variables est non les objets
        
# 5-Modele
    ## Exercice 2
        je n'ai pas eu le problème Identifiable car j'ai directement rajouté l'Id comme dans games
    
    ## Exercice 3
        le tag permet de lié chaque picker a une valeur 

# 7-Animation
    ## Exercice 1
        https://www.canva.com/design/DAGYVKT7bPA/xEYjWQs0NdunY76_FbrC9A/view?utm_content=DAGYVKT7bPA&utm_campaign=designshare&utm_medium=link&utm_source=editor
        
    ## Exercice 2
        Plusieurs animations sont/peuvent se déclenchées en même temps ou si la condition n'est pas remplie, l'animation ne se lancera pas.
    
    ## Exercice 3
        j'ai rajouté un shaking sur le 'Text("Item Unique")'
