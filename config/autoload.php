<?php


class autoload{
    public static function register(){
        spl_autoload_register(array(__CLASS__,'load'));
    }

    public static function load($class){
        //rem[placer les antislash par slash]
        $b = str_replace("\\","/",$class);

        //avoir le chemin absolu
        $full= __DIR__.$b.".php";

        //retirer le dossier de l'autoload dans le chemin absolu
        $total= str_replace("config","",$full);

        //verifier si le fichier existe 
        if(file_exists($total)){
            require_once $total;
        }
    }
}

autoload::register();




























?>