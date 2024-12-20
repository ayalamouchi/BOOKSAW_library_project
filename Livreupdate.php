<?php
// Inclure la connexion à la base de données
include 'dbconnect.php';

if (!empty($_POST)) {
    // Récupérer les données du formulaire
    $id = $_POST['id'];
    $titre = $_POST['titre'];
    $auteur = $_POST['auteur'];
    $genre = $_POST['genre'];
    $resume = $_POST['resume'];
    $disponibilite = $_POST['disponibilite'];
    $nombre_exemplaire = $_POST['nbexp'];
    $langue = $_POST['langue'];
    $nombre_page = $_POST['nbpage'];
    $image = $_POST['image'];

    try {
        // Préparer la requête SQL pour mettre à jour les données
        $sql = "UPDATE livres
                SET titre = :titre,
                    auteur = :auteur,
                    genre = :genre,
                    resume = :resume,
                    disponibilite = :disponibilite,
                    nombre_exemplaires = :nombre_exemplaire,
                    langue = :langue,
                    nombre_pages = :nombre_page,
                    image = :image
                WHERE id = :id";

        $stmt = $base->prepare($sql);
        $stmt->execute([
            ':titre' => $titre,
            ':auteur' => $auteur,
            ':genre' => $genre,
            ':resume' => $resume,
            ':disponibilite' => $disponibilite,
            ':nombre_exemplaire' => $nombre_exemplaire,
            ':langue' => $langue,
            ':nombre_page' => $nombre_page,
            ':image' => $image,
            ':id' => $id
        ]);

        // Rediriger vers la page d'accueil après mise à jour
        header('Location: index.php');
        exit();
    } catch (PDOException $e) {
        // Gérer les erreurs SQL
        die("Erreur lors de la mise à jour : " . $e->getMessage());
    }
}

// Si pas de POST, récupérer les données du livre pour le formulaire
if (isset($_GET['id'])) {
    $reponse = $base->prepare("SELECT * FROM livres WHERE id = ?");
    $reponse->execute([$_GET['id']]);
    $livres = $reponse->fetch();

    if (!$livres) {
        die("Livre introuvable.");
    }
} else {
    die("ID du livre non spécifié.");
}

// Variables pour le template
$template = "Livreupdate";
$page_title = "Update BOOK";
include 'layout.phtml';
?>
