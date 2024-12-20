
<?php
    session_start() ; 
    include 'dbconnect.php';
    $query = $base->prepare("SELECT id, titre, auteur, image, disponibilite FROM livres");
    $query->execute();
    $cls = $query->fetchAll();
    $page_title="Books Home";
    $template="ListeLivre_CLT";
    include "layout.phtml";
?>



