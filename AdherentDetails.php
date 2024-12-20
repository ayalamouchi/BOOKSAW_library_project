
    
<?php
   include 'dbconnect.php';
    $query=$base->query("select * FROM adherants WHERE id=$_GET[id]");
    $adherent=$query->fetch(PDO::FETCH_ASSOC);
    $page_title="Adherent Details";
    $template="AdherentDetails";
    include "Layout.phtml";
?>
				