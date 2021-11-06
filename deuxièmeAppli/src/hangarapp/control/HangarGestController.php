<?php

namespace hangarapp\control;

use mf\utils\HttpRequest as HttpRequest;
use mf\router\Router as Router;
use hangarapp\model\Categorie as Categorie;
use hangarapp\model\Commande as Commande;
use hangarapp\model\Gerant as Gerant;
use hangarapp\model\Panier as Panier;
use hangarapp\model\Producteur as Producteur;
use hangarapp\model\Produit as Produit;
use hangarapp\view\HangarGestView as HangarGestView;
use hangarapp\auth\HangarAuthentification as HangarAuthentification;

/* Classe HangarController :
 *  
 * Réalise les algorithmes des fonctionnalités suivantes: 
 *
 *  - afficher la liste des Tweets 
 *  - afficher un Tweet
 *  - afficher les tweet d'un utilisateur 
 *  - afficher la le formulaire pour poster un Tweet
 *  - afficher la liste des utilisateurs suivis 
 *  - évaluer un Tweet
 *  - suivre un utilisateur
 *   
 */

class HangarGestController extends \mf\control\AbstractController {


    /* Constructeur :
     * 
     * Appelle le constructeur parent
     *
     * c.f. la classe \mf\control\AbstractController
     * 
     */
    
    public function __construct()
    {
        parent::__construct();
    }


    /* Méthode viewHome : 
     * 
     * Réalise la fonctionnalité : afficher la liste de Tweet
     * 
     */
    
    public function viewHome($id = null){

        $route = new Router();/*
        $id_prod = $id ?? $this->request->get('Id');/*
        $prod = Producteur::find($id_prod);
        $vueProd = new HangarView($prod);
*/
        $commande = Commande::select('Commande.Id','Commande.Montant','Produit.Id','Produit.Nom'.'Panier.Quantite')
            ->from('Commande', 'Produit','Panier')
            ->join('Panier','Commande.Id','=','Panier.Id_Commande')
            ->join('Produit','Panier.Id_Produit','=','prod.Id')
            ->where('Produit.Id_Producteur','=',"3"); //////Identifiant producteur à revoir
        $vueCommande = new HangarGestView($commande);
        // echo $vueTweets->renderHome();
        echo $vueCommande->render('renderHome');

/*        SELECT Commande.Id, Commande.Nom_client 
FROM Commande 
LEFT JOIN Panier ON Commande.Id = Panier.Id_Commande 
LEFT JOIN Produit ON Panier.Id_Produit = Produit.Id 
WHERE Produit.Id_Producteur = 2;*/
    }


    public function viewProductor($id=null){

        /*$requete = tweet::where('id','=',$id)->first();
        $result = $requete->author()->get();*/

        $route = new Router();
        //$http_req = new HttpRequest();
        //$idTweet = $http_req->get['id'];
        //$tweet = Tweet::find($idTweet);
        /*
        $author = $tweet->author()->first();

        $link_user = $route->urlFOr('usertweets',[['id',"$author->id"]]);

        $htmlTweet =
        "<div style='border: 1px solid black; text-align: center'> $tweet->text</div>
        <div style='font-weight: bolder'>AUTHOR : <a href=" . $link_user . "> $author->username </a>\n</div>
        <div style='font-size: smaller'>Created at $tweet->created_at \n</div>
        <div style='font-size: smaller'>Score $tweet->score \n</div>";
fol
        return $htmlTweet;*/

        $id_productor = $id ?? $this->request->get['Id'];
        $productor = Tweet::find($id_productor);
        $vueProductors = new TweeterView($productor);
        $vueProductors->render('viewProductor');
         

    }
/*
    public function viewLogin(){

        $view_login = new HangarGestView("");
        $view_login->render("renderLogin");
    }*/
}