
<?php
    session_start();
    include 'dbconnect.php';
    $query = $base->prepare("SELECT id, titre, auteur, image, disponibilite FROM livres");
    $query->execute();
    $cls = $query->fetchAll();
    $titre="Books Home";
    $template="ListeLivre_A";
    include "layout.phtml";
?>



