Nom-Prenom des participants:
CAI Alice
CAI Florence
Dautecourt Thomas
Laouer Nathan
Perignon Armand

## leHangar.local

Un magasin coopératif de producteurs locaux souhaite développer une application de commandes 
en ligne. L'objectif est de permettre à ses usagers de passer commande en ligne et de venir chercher 
sur place la commande préparée.
Les produits vendus sont de différentes catégories : fruits et légumes, produits laitiers, épicerie, 
épicerie sucrée, pain et boulangerie, volaille, viande etc ...

```mermaid
flowchart TB

a((Utilisateur))
A[Consulter]
A'[(Liste des produits)]

b((Gérant))
B[S'authentifier]
B'[Consulter]

c((Producteur))
C[S'authentifier]

d[/Commande\]
D[Gérer]

e['Catégorie']
E[Panier]




style a  fill:#F99
style b  fill:#f99
style c  fill:#f99
style e  fill:#a99

style A  fill:#ffc
style B' fill:#ffc
style B  fill:#cff
style C  fill:#cff
style D  fill:#cfc


style A'  fill:#fcf

a==>A
A-->A'
A-->c
e-.->A'
A'-->E

b==>B
B--Ajouter-->c
B==>D 
B==>B' 
B'-->d

c==>C 
C--Modifier-->A'
C--Ajouter-->A'
C-->B'

D-->e

E-->d
```

