<?php

namespace hangarapp\model;

class Produit extends \Illuminate\Database\Eloquent\Model{
    protected $table = "Produit";
    public $primaryKey = "Id";
    public $timestamps = false;

    public function productor(){
        return $this->HasMany('hangarapp\model\Producteur','Id');
    }
}