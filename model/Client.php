<?php
    namespace model;

    //require_once 'M_db.php';
    
    class Client{
        private $db;
        public function __construct()
        {
             $DB = new DB();
             $this->db = $DB->getConnexion();
        }

        public function addClientS($matricule,$cni,$nom,$prenom,$sexe,$datenaiss,$tel,$adresse,$email){
            $sql = "INSERT INTO personne VALUES('$matricule','$cni','$nom','$prenom','$sexe',
            '$datenaiss','$tel','$adresse','$email',null,null,null,null,null,null)";
         
            var_dump($sql);
            return $this->db->exec($sql);
    }

    public function addClientC($matricule,$cni,$nom,$prenom,$sexe,$datenaiss,$tel,$adresse,$email,$raison_sociale,$salaire,$nom_employeur,$adr_employeur){
        $sql = "INSERT INTO personne VALUES('$matricule','$cni','$nom','$prenom','$sexe','$datenaiss','$tel','$adresse','$email','$raison_sociale',$salaire,'$nom_employeur','$adr_employeur',null,null)";
        
        return $this->db->exec($sql);
    }

    public function addEntreprise($nom_entreprise,$tel_entreprise,$email_entreprise,$budget_entreprise,$adr_entreprise){
        $budget_entreprise = floatval($budget_entreprise);
        $sql = "INSERT INTO entreprise VALUES(null,'$nom_entreprise','$tel_entreprise'
        ,'$email_entreprise',null,null,$budget_entreprise,'$adr_entreprise')";
        

        $this->db->exec($sql);
        return  $this->db->lastInsertId();
    }

    public function searchClientbyMat($mat){
        $sql = "SELECT * FROM personne WHERE cin LIKE '%".$mat."%'";
        
        return $this->db->query($sql);

    }
 }
    

  
    ?>