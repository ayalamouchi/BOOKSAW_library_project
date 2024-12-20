<?php
    include 'dbconnect.php';
    
    $reponse = $base->prepare('DELETE FROM adherants WHERE id=?');
    $reponse->execute([$_GET['id']]);
    header('Location:index.php');
    exit();


    ?>