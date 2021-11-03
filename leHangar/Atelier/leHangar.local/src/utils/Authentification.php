<?php

namespace app\utils;

use app\utils\exception\AuthentificationException as AuthentificationExcep;

class Authentification extends mf\auth\AbstractAuthentification{

    public function __construct(){
        if(isset($_SESSION['user_login'])) {
            $this->user_login = $_SESSION['user_login'];
            $this->access_level = $_SESSION['access_level'];
            $this->logged_in = true;
        } else {
            $this->user_login = null;
            $this->access_level = self::ACCESS_LEVEL_NONE;
            $this->logged_in = false;
        }
    }

    public function updateSession($username, $level){
        $this->user_login = $username;
        $this->access_level = $level;

        $_SESSION['user_login'] = $username;
        $_SESSION['access_level'] = $level;

        $this->logged_in = true;
    }
    
    public function logout(){
        $_SESSION['user_login'] = null;
        $_SESSION['access_level'] = null;

        $this->user_login = null;
        $this->access_level = null;

        $this->logged_in = false;
    }
    
    public function checkAccessRight($requested){
        if($requested > $this->access_level){
            return true;
        }
        else{
            return false;
        }
    }

    public function login($username, $db_pass, $given_pass, $level){
        if(!$this->verifyPassword($given_pass, $db_pass)) {
            $msg_mdp_erreur = "Erreur Mdp";
            throw new AuthentificationExcep($msg_pwd_error);
        } else {
            $this->updateSession($username, $level);
        }
    }
    
    protected function hashPassword($password){
        return password_hash($password);
    }
    
    protected function verifyPassword($password, $hash){
        return password_verify($password,$hash);
    }
}

?>