<?php
    namespace model;
    //require_once 'M_db.php';

    class Compte{
        private $db;
        public function __construct()
        {
            $DB = new DB();
             $this->db = $DB->getConnexion();
        }

        public function addCompte($numero,$matricule,$rib,$solde,$dateOuve,$fraisOuv,$remuneration,$typeCompte){

        $sql = "INSERT INTO compte (numero, mat, rib, solde, dateOuverture, fraisOuverture, remuneration, typeCompte)
             VALUES ('$numero','$matricule',$rib,$solde,'$dateOuve',$fraisOuv,$remuneration,$typeCompte)";

        return $this->db->exec($sql);
    }

    public function addCompteCourant($numero,$matricule,$rib,$solde,$dateOuve,$agios,$typeCompte){

        $sql = "INSERT INTO compte (numero, mat, rib, solde, dateOuverture, agios, typeCompte)
             VALUES ('$numero','$matricule',$rib,$solde,'$dateOuve',$agios,$typeCompte)";
        

        return $this->db->exec($sql);
    }

    public function addCompteBloque($numero,$matricule,$rib,$solde,$dateOuve,$fraisOuv,$remuneration,$date_debut,$date_fin,$typeCompte){

        $sql = "INSERT INTO compte (numero, mat, rib, solde, dateOuverture, fraisOuverture, remuneration, dateDebut,dateFin,typeCompte)
             VALUES ('$numero','$matricule',$rib,$solde,'$dateOuve',$fraisOuv,$remuneration,'$date_debut','$date_fin',$typeCompte)";


        return $this->db->exec($sql);
    }

    function addSimpleEntreprise($numero,$id_entreprise,$rib,$solde,$dateOuve,$fraisOuv,$remuneration,$typeCompte){

        $sql = "INSERT INTO compte (numero, id_entreprise, rib, solde, dateOuverture, fraisOuverture, remuneration, typeCompte)
             VALUES ('$numero','$id_entreprise',$rib,$solde,'$dateOuve',$fraisOuv,$remuneration,$typeCompte)";
        

        return $this->db->exec($sql);
    }

    public function addBloqueEntreprise($numero,$id_entreprise,$rib,$solde,$dateOuve,$fraisOuv,$remuneration,$date_debut,$date_fin,$typeCompte){

        $sql = "INSERT INTO compte (numero, id_entreprise, rib, solde, dateOuverture, fraisOuverture, remuneration, dateDebut,dateFin,typeCompte)
             VALUES ('$numero','$id_entreprise',$rib,$solde,'$dateOuve',$fraisOuv,$remuneration,'$date_debut','$date_fin',$typeCompte)";
    

        return $this->db->exec($sql);

    }
    }

