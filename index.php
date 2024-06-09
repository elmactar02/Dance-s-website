<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "votre_base_de_donnees";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("La connexion a échoué: " . $conn->connect_error);
}

// Récupérer les données utilisateur
$sql = "SELECT * FROM utilisateurs WHERE id = 1"; // Modifier l'ID selon vos besoins
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Afficher les données utilisateur
    while($row = $result->fetch_assoc()) {
        $nom = $row["nom"];
        $date_naissance = $row["date_naissance"];
        $email = $row["email"];
        $telephone = $row["telephone"];
        $adresse = $row["adresse"];
        $paiement = $row["paiement"];
    }
} else {
    echo "0 résultats";
}
$conn->close();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espace Client</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="#">ABONNEMENT</a></li>
                <li><a href="#">PAIEMENTS</a></li>
                <li><a href="#">MES DONNÉES PERSONNELLES</a></li>
                <li><a href="#">SERVICES</a></li>
                <li><a href="#">ENTRAÎNEMENTS VIDÉO</a></li>
              