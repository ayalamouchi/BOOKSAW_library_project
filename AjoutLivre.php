<?php
    include 'dbconnect.php';
    if(!empty($_POST)){
    $titre = $_POST['titre'];
    $auteur = $_POST['auteur'];
    $genre = $_POST['genre'];
    $resume = $_POST['resume'];
    $disponibilite =isset($_POST['disponibilite']) ? $_POST['disponibilite'] : 1;
    $nombre_exemplaires = $_POST['nombre_exemplaires'];
    $langue = $_POST['langue'];
    $image_couverture = $_POST['image_couverture']; 
    $nombrePages = $_POST['nombrePages'];

    $sql = "INSERT INTO livres (titre, auteur, genre,resume, disponibilite, nombre_exemplaires, langue, image_couverture, nombre_pages) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $query=$base->prepare($sql);
    $query->execute([$titre,$auteur, $genre,$resume,$disponibilite, $nombre_exemplaires,$langue ,$image_couverture,$nombrePages]);
    }
    
    
    $page_title="New Book";
    $template="AjoutLivre";
    include "Layout.phtml";
?>

