<!DOCTYPE html>
<html lang="nl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PrijsCheck</title>
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

<main>
  <form class="toolbar" method="get">
    <input class="search" name="q" type="search" placeholder="Zoek product…" value="<?= e($_GET['q'] ?? '') ?>">
      </button>
  </form>

  <div class="table-wrap">
    <table>
      <thead>
        <tr>
          <th class="name">Product</th>
          <th class="unit">Eenheid</th>
        </tr>
      </thead>
      <tbody>
          <tr>
            <td class="name">
              <div class="name-row"><span><?= e($p['icon']) ?></span><?= e($p['name']) ?></div>
              <span class="save">bespaar tot <?= euro($max - $min) ?></span>
            </td>
            <td class="unit"><?= e($p['unit']) ?></td>
      </tbody>
    </table>
  </div>
</main>

</body>
</html>