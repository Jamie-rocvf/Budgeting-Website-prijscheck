<?php
   $conn = require_once "partials/dbconnection.php";
   $user_ID = 1; // tijdelijk, tot er een login is

   // Afvinken of verwijderen (POST), daarna terug naar de pagina
   if ($_SERVER['REQUEST_METHOD'] === 'POST') {
       $prijzen_ID = (int)($_POST['prijzen_ID'] ?? 0);
       if (isset($_POST['verwijder'])) {
           $stmt = $conn->prepare("DELETE FROM lijst WHERE user_ID = ? AND prijzen_ID = ?");
       } else {
           $stmt = $conn->prepare("UPDATE lijst SET afgevinkt = NOT afgevinkt WHERE user_ID = ? AND prijzen_ID = ?");
       }
       $stmt->bind_param("ii", $user_ID, $prijzen_ID);
       $stmt->execute();
       $stmt->close();
       header("Location: list.php");
       exit;
   }

   $stmt = $conn->prepare("
       SELECT l.prijzen_ID, l.afgevinkt, p.product, p.Class, p.AH, p.Lidl, p.Jumbo, p.Vomar, p.Plus,
              p.Dirk, p.Aldi, p.Dekamarkt, p.Spar, p.Sligro
       FROM lijst l
       JOIN prijzen p ON p.ID = l.prijzen_ID
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
    <title>Document</title>
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
        <tr style="<?php echo $row['afgevinkt'] ? 'text-decoration: line-through; opacity: 0.5;' : ''; ?>">
            <td>
                <form id="rij-<?php echo $row['prijzen_ID']; ?>" method="post">
                    <input type="hidden" name="prijzen_ID" value="<?php echo $row['prijzen_ID']; ?>">
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
            <td><button type="submit" name="verwijder" value="1" form="rij-<?php echo $row['prijzen_ID']; ?>">verwijder</button></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>