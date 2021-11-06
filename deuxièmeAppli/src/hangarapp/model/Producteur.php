<?php

namespace hangarapp\model;


class Producteur extends \Illuminate\Database\Eloquent\Model{
    
    protected $table = "Producteur";
    public $primaryKey = "id";
    public $timestamps = false;

    public function lesProduits(){
        return $this->belongsTo('hangarapp\model\Produit','Id');
    }    
    
    public function ajoutProducteur($nom,$localisation,$mail,$mdp){
        $p = new Producteur();
        $p->Nom = $nom;
        $p->Localisation = $localisation;
        $p->Mail = $mail;
        $p->Mdp = $mdp;
    }
    
}    
    
    
    
    /*private $id;
    private $nom;
    private $localisation;
    private $mail;
    private $mdp;
    private $BDD;

    public function __construct(){
        /*$this->id=$id;
        $this->nom=$nom;
        $this->localisation=$localisation;
        $this->mail=$mail;
        $this->mdp=$mdp;
        $this->BDD = new Data;
    }

    public function ajoutProducteur($nom,$localisation, $mail, $mdp){
        //Fonction pour créer un nouveau producteur dans la table correspondante.
        $connexion = $this->BDD->connexionPDO();
        $req = $connexion->prepare("INSERT INTO `Producteur`(`Id`, `Nom`, `Localisation`,`Mail`,`Mdp`) VALUES (0,:nom,:localisation,:mail,:mdp)");
        $req->bindValue(":nom", $nom, PDO::PARAM_STR);
        $req->bindValue(":localisation", $localisation, PDO::PARAM_STR);
        $req->bindValue(":mail", $mail, PDO::PARAM_STR);
        $req->bindValue(":mdp", $mdp, PDO::PARAM_STR);
        //$req = $connexion->prepare($requete);
        $req->execute();
    }

    public function GetAllProducteur(){
        $connexion = $this->BDD->connexionPDO();
        $req = $connexion->query("SELECT * FROM `Producteur`");
        //echo $req;
        //$req = $connexion->prepare($requete);
        //$req->execute();
        /*$result = $req->fetch(PDO::FETCH_ASSOC);
        return $result;


        while($result = $req->fetch()){
            echo 'Identifiant : '.$result["Id"].'  Nom : '.$result["Nom"].'   Mail : '.$result["Mail"].'<br>';
            echo '<img src="img/'.$result["Nom"].'.png"><br>';	
        }
    }



    public function getId()
    {
        return $this->id;
    }
    public function getNom()
    {
        return $this->nom;
    }
    public function getLocalisation()
    {
        return $this->localisation;
    }
    public function getMail()
    {
        return $this->mail;
    }
    public function getMdp()
    {
        return $this->mdp;
    }*/
