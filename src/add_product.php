<?php
   $conn = require_once "partials/dbconnection.php";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $product = $_POST['product'];
        $Class = $_POST['class'];
        $AH = $_POST['ah'];
        $Lidl = $_POST['lidl'];
        $Jumbo = $_POST['jumbo'];
        $Vomar = $_POST['vomar'];
        $Plus = $_POST['plus'];
        $Dirk = $_POST['dirk'];
        $Aldi = $_POST['aldi'];
        $Dekamarkt = $_POST['dekamarkt'];
        $Spar = $_POST['spar'];
        $Sligro = $_POST['sligro'];

        $user_ID = 1; // tijdelijk, tot er een login is

        $stmt = $conn->prepare("INSERT INTO toevoegproduct (user_ID, product, Class, AH, Lidl, Jumbo, Vomar, Plus, Dirk, Aldi, Dekamarkt, Spar, Sligro) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("issdddddddddd", $user_ID, $product, $Class, $AH, $Lidl, $Jumbo, $Vomar, $Plus, $Dirk, $Aldi, $Dekamarkt, $Spar, $Sligro);
        $stmt->execute();
        $stmt->close();
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="POST" action="">
        <input type="text" name="product" placeholder="example: milk 1L" value="<?php if (isset($product)) echo htmlspecialchars($product); ?>">

        <div class="klasse">
            <input type="radio" name="class" id="class-zuivel" value="zuivel" required <?php if (isset($Class) && $Class === 'zuivel') echo 'checked'; ?>><label for="class-zuivel">zuivel</label>
            <input type="radio" name="class" id="class-vlees" value="vlees" <?php if (isset($Class) && $Class === 'vlees') echo 'checked'; ?>><label for="class-vlees">vlees</label>
            <input type="radio" name="class" id="class-groente" value="groente" <?php if (isset($Class) && $Class === 'groente') echo 'checked'; ?>><label for="class-groente">groente</label>
            <input type="radio" name="class" id="class-fruit" value="fruit" <?php if (isset($Class) && $Class === 'fruit') echo 'checked'; ?>><label for="class-fruit">fruit</label>
            <br>
            <input type="radio" name="class" id="class-brood" value="brood" <?php if (isset($Class) && $Class === 'brood') echo 'checked'; ?>><label for="class-brood">brood</label>
            <input type="radio" name="class" id="class-snacks" value="snacks" <?php if (isset($Class) && $Class === 'snacks') echo 'checked'; ?>><label for="class-snacks">snacks</label>
            <input type="radio" name="class" id="class-dranken" value="dranken" <?php if (isset($Class) && $Class === 'dranken') echo 'checked'; ?>><label for="class-dranken">dranken</label>
            <input type="radio" name="class" id="class-overig" value="overig" <?php if (isset($Class) && $Class === 'overig') echo 'checked'; ?>><label for="class-overig">overig</label>
        </div>



        <input type="number" name="ah" placeholder="AH" step="0.01" min="0" <?php if (isset($ah)) echo 'value="' . htmlspecialchars($ah) . '"'; ?>>
        <br>
        <input type="number" name="lidl" placeholder="Lidl" step="0.01" min="0" <?php if (isset($Lidl)) echo 'value="' . htmlspecialchars($Lidl) . '"'; ?>>
        <br>
        <input type="number" name="jumbo" placeholder="Jumbo" step="0.01" min="0" <?php if (isset($Jumbo)) echo 'value="' . htmlspecialchars($Jumbo) . '"'; ?>>
        <br>
        <input type="number" name="vomar" placeholder="Vomar" step="0.01" min="0" <?php if (isset($Vomar)) echo 'value="' . htmlspecialchars($Vomar) . '"'; ?>>
        <br>
        <input type="number" name="plus" placeholder="Plus" step="0.01" min="0" <?php if (isset($Plus)) echo 'value="' . htmlspecialchars($Plus) . '"'; ?>>
        <br>
        <input type="number" name="dirk" placeholder="Dirk" step="0.01" min="0" <?php if (isset($Dirk)) echo 'value="' . htmlspecialchars($Dirk) . '"'; ?>>
        <br>
        <input type="number" name="aldi" placeholder="Aldi" step="0.01" min="0" <?php if (isset($Aldi)) echo 'value="' . htmlspecialchars($Aldi) . '"'; ?>>
        <br>
        <input type="number" name="dekamarkt" placeholder="Dekamarkt" step="0.01" min="0" <?php if (isset($Dekamarkt)) echo 'value="' . htmlspecialchars($Dekamarkt) . '"'; ?>>
        <br>    
        <input type="number" name="spar" placeholder="Spar" step="0.01" min="0" <?php if (isset($Spar)) echo 'value="' . htmlspecialchars($Spar) . '"'; ?>>
        <br>
        <input type="number" name="sligro" placeholder="Sligro" step="0.01" min="0" <?php if (isset($Sligro)) echo 'value="' . htmlspecialchars($Sligro) . '"'; ?>>
        <br>
        <input type="button" value="Annuleer" onclick="location.href='home.php'">

        <input type="submit" value="Voeg product toe">
    </form>
</body>
</html>