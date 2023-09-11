<?php

class OrderRepository
{
    public static function create($userId, $userComment)
    {
        $db = Db::getConnection();

        $sql = 'INSERT INTO orders (user_id, user_comment) '
            . 'VALUES (:user_id, :user_comment)';

        $result = $db->prepare($sql);
        $result->bindParam(':user_id', $userId, PDO::PARAM_STR);
        $result->bindParam(':user_comment', $userComment, PDO::PARAM_STR);

        $result->execute();

        $lastId = $db->lastInsertId();

        return $lastId;
    }

    public static function createProductInfo($orderId, $productId, $quantity, $price, $totalPrice)
    {
        $db = Db::getConnection();

        $sql = 'INSERT INTO order_items (order_id, product_id, quantity, price, total_price) '
            . 'VALUES (:order_id, :product_id, :quantity, :price, :total_price)';

        $result = $db->prepare($sql);
        $result->bindParam(':order_id', $orderId, PDO::PARAM_INT);
        $result->bindParam(':product_id', $productId, PDO::PARAM_INT);
        $result->bindParam(':quantity', $quantity, PDO::PARAM_INT);
        $result->bindParam(':price', $price, PDO::PARAM_STR);
        $result->bindParam(':total_price', $totalPrice, PDO::PARAM_STR);

        return $result->execute();
    }

    public static function getOrdersList()
    {
        $db = Db::getConnection();

        $result = $db->query('SELECT id, user_id, user_comment, created_at, status FROM orders ORDER BY id DESC');
        $ordersList = array();
        $i = 0;
        while ($row = $result->fetch()) {
            $ordersList[$i]['id'] = $row['id'];
            $ordersList[$i]['user_id'] = $row['user_id'];
            $ordersList[$i]['user_comment'] = $row['user_comment'];
            $ordersList[$i]['created_at'] = $row['created_at'];
            $ordersList[$i]['status'] = $row['status'];
            $i++;
        }
        return $ordersList;
    }

    public static function getOrderProductsById($id)
    {
        $db = Db::getConnection();

        $sql = 'SELECT * FROM order_items WHERE order_id = :order_id';

        $result = $db->prepare($sql);
        $result->bindParam(':order_id', $id, PDO::PARAM_INT);

        $result->execute();

        $ordersProduct = array();
        $i = 0;
        while ($row = $result->fetch()) {
            $ordersProduct[$i]['id'] = $row['id'];
            $ordersProduct[$i]['order_id'] = $row['order_id'];
            $ordersProduct[$i]['product_id'] = $row['product_id'];
            $ordersProduct[$i]['quantity'] = $row['quantity'];
            $ordersProduct[$i]['price'] = $row['price'];
            $ordersProduct[$i]['total_price'] = $row['total_price'];
            $i++;
        }
        return $ordersProduct;
    }

    public static function getOrderById($id)
    {
        $db = Db::getConnection();

        $sql = 'SELECT * FROM orders WHERE id = :id';

        $result = $db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);

        $result->setFetchMode(PDO::FETCH_ASSOC);

        $result->execute();

        return $result->fetch();
    }

    public static function deleteOrderById($id)
    {
        $db = Db::getConnection();

        $sql = 'DELETE FROM orders WHERE id = :id';

        $result = $db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);
        return $result->execute();
    }
}
