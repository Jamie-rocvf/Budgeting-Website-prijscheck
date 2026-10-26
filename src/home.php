<?php
   $conn = require_once "partials/dbconnection.php";
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
   <link rel="stylesheet" href="style.css">
</head>
<body>

<header class="topbar">
  <div class="brand"></div> PrijsCheck</div>
  <nav class="tabs">
    <a class="tab active" href="?view=vergelijker">vergelijker</a>
    <a class="tab" href="?view=lijst">lijst</a>
  </nav>
  <div class="right">
    <a class="icon" href="?view=add">+</a>
  </div>
</header>

<input type="button" value="alle" onclick="location.href='test-1.php'">
    <input type="button" value="zuivel" onclick="location.href='test-1.php?filter=zuivel'">
    <input type="button" value="vlees" onclick="location.href='test-1.php?filter=vlees'">
    <input type="button" value="groente" onclick="location.href='test-1.php?filter=groente'">
    <input type="button" value="fruit" onclick="location.href='test-1.php?filter=fruit'">
    <input type="button" value="brood" onclick="location.href='test-1.php?filter=brood'">
    <input type="button" value="snacks" onclick="location.href='test-1.php?filter=snacks'">
    <input type="button" value="dranken" onclick="location.href='test-1.php?filter=dranken'">
    <input type="button" value="overig" onclick="location.href='test-1.php?filter=overig'">


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
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>