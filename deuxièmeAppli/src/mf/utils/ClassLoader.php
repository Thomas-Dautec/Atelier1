<?php

namespace mf\utils;

class ClassLoader extends AbstractClassLoader{
    
    protected $prefix = '';
    public $resultat = "";

    public function __construct($file_root)
    {
        $this->prefix = $file_root;
    }
    
    public function loadClass(string $classname)
    {
        $fileName=$this->getFilename($classname);
        $path=$this->makePath($fileName);
        if (file_exists($path))
        {
            require_once($path);
        }
    }

    protected function makePath(string $filename): string
    {
        return $this->prefix.DIRECTORY_SEPARATOR.$filename;
    }

    protected function getFilename(string $classname): string
    {
        return $path = str_replace("\\", DIRECTORY_SEPARATOR, $classname).".php";
    }

}


