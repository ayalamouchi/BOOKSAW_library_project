
<?php
//récuperer les donnes du formulaire aprés avoir mettre à jour
    include 'dbconnect.php';
    if(!(empty($_POST))){
    $id=$_POST['id'];
    $nom=$_POST['nom'];
    $prenom=$_POST['prenom'];
    $mot_de_passe=$_POST['mot_de_passe'];
    $date_naissance=$_POST['date_naissance'];
    $Sexe=$_POST['sexe'];
    $type_adherant=$_POST['type_adherent'];
    $genre=$_POST['genre'];



//les modifier dans la base de données
    $sql="UPDATE adherants
    SET id='$id',
    nom='$nom',
    prenom='$prenom',
    password='$mot_de_passe',
    date_naiss='$date_naissance',
    type_adherent='$type_adherant',
   
    genre='$genre'
    WHERE id=$id";
    $reponse = $base->prepare($sql);
    $reponse->execute();
    $adherants=$reponse->fetchAll();
    header('Location:index.php');
    exit();


    }
     // Recupérer les anciennes infos de l'adherant
    $reponse = $base->prepare("SELECT * FROM adherants WHERE id=?");
    $reponse->execute([$_GET['id']]);
    $adherants=$reponse->fetch();




    $template="adherants_update";
    $page_title="Update";
    include'layout.phtml';
    ?>
    