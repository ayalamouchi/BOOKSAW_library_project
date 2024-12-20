<?php

    include 'dbconnect.php';
    $query=$base->prepare("select * FROM adherants");
    $query->execute();
    $cls=$query->fetchAll();
    $page_title="Adherent Home";
    $template="ListeAdherent";
    include "Layout.phtml";
?>