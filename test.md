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

c((Producteur))
C[S'authentifier]



style a  fill:#F99
style b  fill:#f99
style c  fill:#f99

style A  fill:#ffc
style B  fill:#cff
style C  fill:#cff


style A'  fill:#fcf

a==>A
A-->A'

b==>B
B--Ajouter-->C

c==>C 
C--Modifier-->A'
C--Ajouter-->A'
```

