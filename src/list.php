<?php
   $conn = require_once "partials/dbconnection.php";
   $user_ID = 1; // tijdelijk, tot er een login is

   // Afvinken of verwijderen (POST), daarna terug naar de pagina
   if ($_SERVER['REQUEST_METHOD'] === 'POST') {
       $prijzen_ID = (int)($_POST['prijzen_ID'] ?? 0);
       $toevoegproduct_ID = (int)($_POST['toevoegproduct_ID'] ?? 0);

       // Een rij is ofwel een product uit prijzen, ofwel uit toevoegproduct
       if ($prijzen_ID > 0) {
           $kolom = 'prijzen_ID';
           $waarde = $prijzen_ID;
       } else {
           $kolom = 'toevoegproduct_ID';
           $waarde = $toevoegproduct_ID;
       }

       if (isset($_POST['verwijder'])) {
           $stmt = $conn->prepare("DELETE FROM lijst WHERE user_ID = ? AND $kolom = ?");
       } else {
           $stmt = $conn->prepare("UPDATE lijst SET afgevinkt = NOT afgevinkt WHERE user_ID = ? AND $kolom = ?");
       }
       $stmt->bind_param("ii", $user_ID, $waarde);
       $stmt->execute();
       $stmt->close();
       header("Location: list.php");
       exit;
   }

   // Producten uit prijzen en toevoegproduct samen ophalen
   $stmt = $conn->prepare("
       SELECT l.prijzen_ID, l.toevoegproduct_ID, l.afgevinkt,
              COALESCE(p.product, t.product) AS product,
              COALESCE(p.Class, t.class) AS Class,
              COALESCE(p.AH, t.AH) AS AH,
              COALESCE(p.Lidl, t.Lidl) AS Lidl,
              COALESCE(p.Jumbo, t.Jumbo) AS Jumbo,
              COALESCE(p.Vomar, t.Vomar) AS Vomar,
              COALESCE(p.Plus, t.Plus) AS Plus,
              COALESCE(p.Dirk, t.Dirk) AS Dirk,
              COALESCE(p.Aldi, t.Aldi) AS Aldi,
              COALESCE(p.Dekamarkt, t.Dekamarkt) AS Dekamarkt,
              COALESCE(p.Spar, t.Spar) AS Spar,
              COALESCE(p.Sligro, t.Sligro) AS Sligro
       FROM lijst l
       LEFT JOIN prijzen p ON p.ID = l.prijzen_ID
       LEFT JOIN toevoegproduct t ON t.ID = l.toevoegproduct_ID
       WHERE l.user_ID = ?
   ");
   $stmt->bind_param("i", $user_ID);
   $stmt->execute();
   $result = $stmt->get_result();
   $stmt->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lijst</title>
</head>
<body>
<header class="topbar">
  <div class="brand"></div> PrijsCheck</div>
  <nav class="tabs">
    <a class="tab active" href="home.php">vergelijker</a>
    <a class="tab" href="list.php">lijst</a>
  </nav>
</header>

    <table>
        <tr>
            <th>Afvinken</th>
            <th>Product</th>
            <th>Class</th>
            <th>AH</th>
            <th>Lidl</th>
            <th>Jumbo</th>
            <th>Vomar</th>
            <th>Plus</th>
            <th>Dirk</th>
            <th>Aldi</th>
            <th>Dekamarkt</th>
            <th>Spar</th>
            <th>Sligro</th>
            <th>Verwijderen</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
        <?php $rij = ($row['prijzen_ID'] !== null) ? 'p' . $row['prijzen_ID'] : 't' . $row['toevoegproduct_ID']; ?>
        <tr style="<?php echo $row['afgevinkt'] ? 'text-decoration: line-through; opacity: 0.5;' : ''; ?>">
            <td>
                <form id="rij-<?php echo $rij; ?>" method="post">
                    <input type="hidden" name="prijzen_ID" value="<?php echo (int)$row['prijzen_ID']; ?>">
                    <input type="hidden" name="toevoegproduct_ID" value="<?php echo (int)$row['toevoegproduct_ID']; ?>">
                    <input type="checkbox" onchange="this.form.submit()" <?php echo $row['afgevinkt'] ? 'checked' : ''; ?>>
                </form>
            </td>
            <td><?php echo htmlspecialchars($row['product']); ?></td>
            <td><?php echo htmlspecialchars($row['Class']); ?></td>
            <td><?php echo $row['AH']; ?></td>
            <td><?php echo $row['Lidl']; ?></td>
            <td><?php echo $row['Jumbo']; ?></td>
            <td><?php echo $row['Vomar']; ?></td>
            <td><?php echo $row['Plus']; ?></td>
            <td><?php echo $row['Dirk']; ?></td>
            <td><?php echo $row['Aldi']; ?></td>
            <td><?php echo $row['Dekamarkt']; ?></td>
            <td><?php echo $row['Spar']; ?></td>
            <td><?php echo $row['Sligro']; ?></td>
            <td><button type="submit" name="verwijder" value="1" form="rij-<?php echo $rij; ?>">verwijder</button></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
