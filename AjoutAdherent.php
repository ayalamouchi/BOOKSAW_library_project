<?php
   include 'dbconnect.php';
    if(!empty($_POST))
    {
    $nom = $_POST['nom'];
    $pr = $_POST['prenom'];
    $psw = $_POST['mot_de_passe'];
    $dateN = $_POST['date_naissance'];
    $type = $_POST['type_adherent']; 
    $email=$_POST['email'];
    $genre = $_POST['genre'];
    $sql = "INSERT INTO adherants (nom, prenom, password, date_naiss, type_adherent,email,genre) VALUES (?, ?, ?, ?, ?, ?,?)";
    $query=$base->prepare($sql);
    $query->execute([$nom,$pr,$psw,$dateN,$type,$email,$genre]);
    }
    $page_title="New Adherent";
    $template="AjoutAdherent";
    include "Layout.phtml";
?>
