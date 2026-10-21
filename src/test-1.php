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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
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
            <th>ID</th>
            <th>Product</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
        <tr>
            <td><?php echo $row['ID']; ?></td>
            <td><?php echo $row['product']; ?></td>
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
    <table>
        <tr>
            <th>ID</th>
            <th>product</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
        <tr>
            <td><?php echo $row['ID']; ?></td>
            <td><?php echo $row['product']; ?></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>