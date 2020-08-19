<?php
    namespace controller;
    include_once '../config/autoload.php';
    //require_once '../model/M_client.php';
    //require_once '../model/M_compte.php';


    extract($_POST);

    $db = new \model\DB();
    $mat = $db->codeAleatoire(8);
    $numero =$db->codeAleatoire(8);
    $solde = 0;
    $rib = 1;
    $dateOuve = getDateNow();

    $clientS = new \model\Client();
    $compteC = new \model\Compte();
    

    if($choix_client == "nouveau"){

        if($choix_type_client == "physique"){
            if($choixcompte == "simple"){
                $client = $clientS->addClientS($mat,$cni,$nom,$prenom,$sexe,$datenaiss,$tel,$adr,$email);
                $fraisOuv = 25000;
                $remuneration = 10000;
                $typeCompte = 1;
                $compte = $compteC->addCompte($numero,$mat,$rib,$solde,$dateOuve,$fraisOuv,$remuneration,$typeCompte);

                var_dump($compte);
                header("location:../view/V_accueil.php?ok=$compte");
            }elseif($choixcompte == "courant"){
                $client = $clientS->addClientC($mat,$cni,$nom,$prenom,$sexe,$datenaiss,$tel,$adr,$email,$raison_sociale,$salaire,$nom_employeur,$adr_employeur);
                // var_dump($client);
                // die();
                $agios = 10000;
                $typeCompte = 2;
                $compte = $compteC->addCompteCourant($numero,$mat,$rib,$solde,$dateOuve,$agios,$typeCompte);
                var_dump($compte);
                header("location:../view/V_accueil.php?ok=$compte");
            }else{
                $client = $clientS->addClientS($mat,$cni,$nom,$prenom,$sexe,$datenaiss,$tel,$adr,$email);
                var_dump($client);
                $fraisOuv = 25000;
                $remuneration = 10000;
                $typeCompte = 3;
                $compte = $compteC->addCompteBloque($numero,$mat,$rib,$solde,$dateOuve,$fraisOuv,$remuneration,$date_debut,$date_fin,$typeCompte);

                var_dump($compte);
                header("location:../view/V_accueil.php?ok=$compte");
            }

        }else{
            $id_entreprise = $clientS->addEntreprise($nom_entreprise,$tel_entreprise,$email_entreprise,$budget_entreprise,$adr_entreprise);
            if($choixcompte == "simple"){
                $fraisOuv = 25000;
                $remuneration = 10000;
                $typeCompte = 1;

                $compte = $compteC->addSimpleEntreprise($numero,$id_entreprise,$rib,$solde,$dateOuve,$fraisOuv,$remuneration,$typeCompte);
                header("location:../view/V_accueil.php?ok=$compte");
            }else{
                $fraisOuv = 20000;
                $remuneration = 7500;
                $typeCompte = 3;
                $compte = $compteC-> addBloqueEntreprise($numero,$id_entreprise,$rib,$solde,$dateOuve,$fraisOuv,$remuneration,$date_debut,$date_fin,$typeCompte);

            }
        }
    }

    function getDateNow()
    {
        $tz_object = new \DateTimeZone('UTC');
        $datetime = new \DateTime();
        $datetime->setTimezone($tz_object);
        return $datetime->format('Y\-m\-d');
    }

?>