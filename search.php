<?php

include_once 'components/Db.php';

$db = Db::getConnection();

$query = $_POST['q'];

$sql = $db->prepare("SELECT id as product_id, name as product_name FROM products WHERE name LIKE :query LIMIT 9");
$sql->bindValue(':query', "%$query%", PDO::PARAM_STR);
$sql->execute();

$rows = $sql->fetchAll();

foreach ($rows as $row) {
  if (isset($row['product_name'])) {
    echo '<li class="search_option"><a href="/product/' . $row['product_id'] . '">' . $row['product_name'] . "</li>";
  }
}
