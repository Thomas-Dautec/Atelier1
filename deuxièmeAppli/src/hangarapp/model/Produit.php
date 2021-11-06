<?php

namespace hangarapp\model;

class Produit extends \Illuminate\Database\Eloquent\Model{
    protected $table = "Produit";
    public $primaryKey = "Id";
    public $timestamps = false;

    public function productor(){
        return $this->belongsTo('hangarapp\model\Producteur','Id_Producteur');
    }

    public function unpanier(){
        return $this->HasMany('hangarapp\model\Panier','Id_Produit');
    }
}