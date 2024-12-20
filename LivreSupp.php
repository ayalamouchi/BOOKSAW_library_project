<?php
    include 'dbconnect.php';
    
    $reponse = $base->prepare('DELETE FROM livres WHERE id=?');
    $reponse->execute([$_GET['id']]);
    header('Location:index.php');
    exit();


    ?>