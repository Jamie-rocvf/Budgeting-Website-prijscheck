<?php
   $conn = require_once "partials/dbconnection.php";
   $user_ID = 1; // tijdelijk, tot er een login is

   // Verwerk de formulieren (POST), daarna terug naar dezelfde pagina
   if ($_SERVER['REQUEST_METHOD'] === 'POST') {
       $actie = $_POST['actie'] ?? '';
       $prijzen_ID = (int)($_POST['prijzen_ID'] ?? 0);

       if ($actie === 'toevoegen') {
           $stmt = $conn->prepare("INSERT IGNORE INTO lijst (user_ID, prijzen_ID) VALUES (?, ?)");
           $stmt->bind_param("ii", $user_ID, $prijzen_ID);
           $stmt->execute();
           $stmt->close();
       } elseif ($actie === 'toevoegen_tp') {
           $tp_ID = (int)($_POST['toevoegproduct_ID'] ?? 0);
           $stmt = $conn->prepare("INSERT IGNORE INTO lijst (user_ID, toevoegproduct_ID) VALUES (?, ?)");
           $stmt->bind_param("ii", $user_ID, $tp_ID);
           $stmt->execute();
           $stmt->close();
       }

       header("Location: " . $_SERVER['REQUEST_URI']);
       exit;
   }

   $stmt = $conn->prepare("SELECT * FROM prijzen");
   $stmt->execute();
   $result = $stmt->get_result();
   $stmt->close();


   if (isset($_GET['filter'])) {
       $filter = $_GET['filter'];
       $stmt = $conn->prepare("SELECT * FROM prijzen WHERE Class = ?");
       $stmt->bind_param("s", $filter);
       $stmt->execute();
       $result = $stmt->get_result();
       $stmt->close();
   }
?>
<!DOCTYPE html>
<html lang="nl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PrijsCheck</title>
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

<input type="button" value="alle" onclick="location.href='home.php'">
    <input type="button" value="zuivel" onclick="location.href='home.php?filter=zuivel'">
    <input type="button" value="vlees" onclick="location.href='home.php?filter=vlees'">
    <input type="button" value="groente" onclick="location.href='home.php?filter=groente'">
    <input type="button" value="fruit" onclick="location.href='home.php?filter=fruit'">
    <input type="button" value="brood" onclick="location.href='home.php?filter=brood'">
    <input type="button" value="snacks" onclick="location.href='home.php?filter=snacks'">
    <input type="button" value="dranken" onclick="location.href='home.php?filter=dranken'">
    <input type="button" value="overig" onclick="location.href='home.php?filter=overig'">


    <h1>Prijzen</h1>
    <table>
        <tr>
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
            <th>Acties</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
        <tr>
            <td><?php echo $row['product']; ?></td>
            <td><?php echo $row['Class']; ?></td>
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
            <td>
                <form method="post" style="display:inline">
                    <input type="hidden" name="actie" value="toevoegen">
                    <input type="hidden" name="prijzen_ID" value="<?php echo $row['ID']; ?>">
                    <button type="submit">+ lijst</button>
                </form>
                <a href="prijs.php?id=<?php echo $row['ID']; ?>">pas aan</a>
            </td>
        </tr>
        <?php endwhile; ?>
    </table>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
    <?php
        $stmt = $conn->prepare("SELECT * FROM toevoegproduct");
        $stmt->execute();
        $result = $stmt->get_result();
        $stmt->close();
        if (isset($_GET['filter'])) {
            $filter = $_GET['filter'];
            $stmt = $conn->prepare("SELECT * FROM toevoegproduct WHERE Class = ?");
            $stmt->bind_param("s", $filter);
            $stmt->execute();
            $result = $stmt->get_result();
            $stmt->close();
        }
    ?>
    <h1>Toegevoegde Producten</h1>
    <input type="button" value="voeg product toe" onclick="location.href='add_product.php'">
    <table>
        <tr>
            <th>product</th>
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
            <th>Acties</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
        <tr>
            <td><?php echo $row['product']; ?></td>
            <td><?php echo $row['Class']; ?></td>
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
            <td>
                <form method="post" style="display:inline">
                    <input type="hidden" name="actie" value="toevoegen_tp">
                    <input type="hidden" name="toevoegproduct_ID" value="<?php echo $row['ID']; ?>">
                    <button type="submit">+ lijst</button>
                </form>
                <a href="prijs.php?tabel=toevoegproduct&amp;id=<?php echo $row['ID']; ?>">pas aan</a>
            </td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>