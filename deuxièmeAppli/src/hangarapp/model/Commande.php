<?php

namespace hangarapp\model;

class Commande extends \Illuminate\Database\Eloquent\Model
{

       protected $table      = 'Commande';  /* le nom de la table */
       protected $primaryKey = 'Id';     /* le nom de la clé primaire */
       public    $timestamps = false;    /* si vrai la table doit contenir
                                            les deux colonnes updated_at,
                                            created_at */  
                                            
      
}