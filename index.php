<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espace Professeur - Asso_dance</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Espace Professeur</h1>
        <nav>
            <ul>
                <li><a href="?section=info">Info Personnel</a></li>
                <li><a href="?section=eleves">Eleves</a></li>
                <li><a href="?section=cours">Cours</a></li>
                <li><a href="?section=achats">Achats</a></li>
            </ul>
        </nav>
        
        <div class="content">
            <?php
                if (isset($_GET['section'])) {
                    $section = $_GET['section'];
                    switch ($section) {
                        case 'info':
                            include 'info.php';
                            break;
                        case 'eleves':
                            include 'eleves.php';
                            break;
                        case 'cours':
                            include 'cours.php';
                            break;
                        case 'achats':
                            include 'achats.php';
                            break;
                        default:
                            echo '<p>Bienvenue sur votre espace professeur.</p>';
                            break;
                    }
                } else {
                    echo '<p>Bienvenue sur votre espace professeur.</p>';
                }
            ?>
        </div>
    </div>
</body>
</html>
