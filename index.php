<?php 
session_start();
include 'dbconnect.php';
$reponseimg1 = $base->query("SELECT image from livres where id=5");

$ligne=$reponseimg1->fetch();
//var_dump($ligne);
$lienimg=$ligne['image'];
$reponseimg2=$base->query("SELECT image from livres where id=10");
$ligne2=$reponseimg2->fetch();
//var_dump($ligne);
$lienimg2=$ligne2['image'];
// LA LISTE DES LIVRES FEATURES BOOK
$reponse=$base->query("SELECT * from livres limit 4");
$infos=$reponse->fetchALL();
//POPULAR BOOK ALL
$reponsedetail=$base->query("SELECT * from livres limit 4 OFFSET 6");
$details=$reponsedetail->fetchALL();

$reponsedet=$base->query("SELECT * from livres limit 4 OFFSET 10");
$detailslivre=$reponsedet->fetchALL();
//ROMANTIC BOOK
$reponsetype = $base->query("SELECT * FROM livres WHERE genre='Romantic'");
$romancelivs=$reponsetype->fetchALL();
// ADVENTURE BOOK
$reponsetypea = $base->query("SELECT * FROM livres WHERE genre='Adventure'");
$advlivs=$reponsetypea->fetchALL();
//FICTION BOOK
$reponsetypeh = $base->query("SELECT * FROM livres WHERE genre LIKE '% Fiction%'");
$ficlivs=$reponsetypeh->fetchALL();
//var_dump($advlivs);
//book with offer
$reponseoffer = $base->query("SELECT * FROM livres WHERE id in(11,12,14,17)");
$offerlivs=$reponseoffer->fetchALL();
//BEST SEELING BOOK
$reponseimg3=$base->query("SELECT * from livres where id=22");
$ligne3=$reponseimg3->fetch();
$page_title="Home";
$template="Accueil";
include("layout.phtml");
?>