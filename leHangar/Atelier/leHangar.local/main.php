<?php
//require_once 'conf/config.ini';
require_once("src/utils/AbstractClassLoader.php");
require_once("src/utils/ClassLoader.php");
ini_set("display_errors","1");

header( 'content-type: text/html; charset=utf-8' );

use app\model\Categorie as Categorie;
use app\model\Commande as Commande;
use app\model\Gerant as Gerant;
use app\model\Panier as Panier;
use app\model\Producteur as Producteur;
use app\model\Produit as Produit;

$loader = new app\utils\ClassLoader('src');
$loader->register();

//$config = parse_ini_file("conf/config.ini");

$serveur = "localhost";
$base = "dautecou5u";
$user = "dautecou5u";
$pass = "ThomasD/200!";
$params = array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION);

$dsn = "mysql:host=$serveur;dbname=$base";

try {
    $db = new \PDO($dsn, $user, $pass, $params);
    //$db = new \PDO("mysql:host=localhost; dbname=execciasie", "root", "", $params);
} catch (\PDOException $e) {
    echo("Connexion error : $dsn". $e->getMessage());
    exit;
}

/*Début du page*/

?>
<html>
    <title>LeHangar.Local</title>
    <link>

<?php


//////////////////



$resultatReqEtud = $db->query("select * from Produit");


while($result1 = $resultatReqEtud->fetch()){
    echo 'Identifiant : '.$result1["Id"].'  Nom : '.$result1["Nom"].'   Description : '.$result1["Description"].'<br>';
    echo '<img src="img/'.$result1["Nom"].'.png"><br>';	
}
?></html>