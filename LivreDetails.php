
    
<?php
    include 'dbconnect.php';
    $query=$base->query("select * FROM livres WHERE id=$_GET[id]");
    $livre=$query->fetch(PDO::FETCH_ASSOC);
    $page_title="Books Details";
    $template="LivreDetails";
    include "Layout.phtml";
?>


