<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $first_name = htmlspecialchars($_POST['first_name']);
    $last_name = htmlspecialchars($_POST['last_name']);
    $username = htmlspecialchars($_POST['username']);
    $email = htmlspecialchars($_POST['email']);
    $password = htmlspecialchars($_POST['password']);
    $confirm_password = htmlspecialchars($_POST['confirm_password']);

    if ($password === $confirm_password) {
        // Connect to the database (update with your database credentials)
        $servername = "localhost";
        $db_username = "root";
        $db_password = "";
        $dbname = "asso_danse";

        $conn = new mysqli($servername, $db_username, $db_password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $password_hash = password_hash($password, PASSWORD_DEFAULT);

        $sql = "INSERT INTO users (first_name, last_name, username, email, password) VALUES ('$first_name', '$last_name', '$username', '$email', '$password_hash')";

        if ($conn->query($sql) === TRUE) {
            echo "<p>Inscription réussie! Vous pouvez maintenant vous <a href='#'>connecter</a>.</p>";
        } else {
            echo "Erreur: " . $sql . "<br>" . $conn->error;
        }

        $conn->close();
    } else {
        echo "<p>Les mots de passe ne correspondent pas.</p>";
    }
}
?>
