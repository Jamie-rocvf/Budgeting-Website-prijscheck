<?php
    $conn = require_once "partials/dbconnection.php";
    $winkels = ['AH', 'Lidl', 'Jumbo', 'Vomar', 'Plus', 'Dirk', 'Aldi', 'Dekamarkt', 'Spar', 'Sligro'];

    // Welke tabel: alleen deze twee zijn toegestaan
    $tabel = $_GET['tabel'] ?? 'prijzen';
    if (!in_array($tabel, ['prijzen', 'toevoegproduct'], true)) {
        die("Ongeldige tabel.");
    }
    $id = (int)($_GET['id'] ?? 0);

    // Opslaan (POST): alleen ingevulde, geldige prijzen worden aangepast
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $sets = [];
        $types = "";
        $values = [];

        foreach ($winkels as $w) {
            $waarde = $_POST[$w] ?? '';
            if ($waarde !== '' && is_numeric($waarde) && $waarde >= 0) {
                $sets[] = "`$w` = ?";
                $types .= "d";
                $values[] = round((float)$waarde, 2);
            }
        }

        if ($sets && $id > 0) {
            $types .= "i";
            $values[] = $id;
            $stmt = $conn->prepare("UPDATE `$tabel` SET " . implode(", ", $sets) . " WHERE ID = ?");
            $stmt->bind_param($types, ...$values);
            $stmt->execute();
            $stmt->close();
        }

        header("Location: home.php");
        exit;
    }

    // Het product ophalen
    $stmt = $conn->prepare("SELECT * FROM `$tabel` WHERE ID = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $product = $stmt->get_result()->fetch_assoc();
    $stmt->close();

    if (!$product) {
        die("Product niet gevonden.");
    }

    // De kolom heet 'Class' in prijzen en 'class' in toevoegproduct
    $klasse = $product['Class'] ?? $product['class'] ?? '';
?>
<!DOCTYPE html>
<html lang="nl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Prijs aanpassen</title>
  <link rel="stylesheet" href="style/style.css">
</head>
<body>

<header class="topbar">
  <div class="brand"></div> PrijsCheck</div>
  <nav class="tabs">
    <a class="tab active" href="home.php">vergelijker</a>
    <a class="tab" href="list.php">lijst</a>
  </nav>
</header>

<h1>Prijs aanpassen</h1>
<p>
    <strong><?php echo htmlspecialchars($product['product']); ?></strong>
    (<?php echo htmlspecialchars($klasse); ?>)
</p>
<p>Vul alleen de winkels in die je wilt wijzigen. Lege velden blijven ongewijzigd.</p>

<form method="post">
    <table>
        <tr>
            <th>Winkel</th>
            <th>Huidige prijs</th>
            <th>Nieuwe prijs</th>
        </tr>
        <?php foreach ($winkels as $w): ?>
        <tr>
            <td><label for="<?php echo $w; ?>"><?php echo $w; ?></label></td>
            <td>€ <?php echo number_format((float)$product[$w], 2, ',', ''); ?></td>
            <td><input type="number" id="<?php echo $w; ?>" name="<?php echo $w; ?>" step="0.01" min="0" placeholder="nieuwe prijs"></td>
        </tr>
        <?php endforeach; ?>
    </table>
    <button type="submit">opslaan</button>
    <a href="home.php">annuleren</a>
</form>

</body>
</html>
