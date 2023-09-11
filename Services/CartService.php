<?php

class CartService
{
    public static function addProduct($id, $num)
    {
        $id = intval($id);

        $productsInCart = array();

        if (isset($_SESSION['products'])) $productsInCart = $_SESSION['products'];

        array_key_exists($id, $productsInCart) ? $productsInCart[$id] += $num : $productsInCart[$id] = $num;

        $_SESSION['products'] = $productsInCart;

        $productsIds = array_keys($productsInCart);

        $products = ProductRepository::getProductsByIds($productsIds);

        $totalPrice = self::getTotalPrice($products);

        $result = array(self::countItems(), $totalPrice);

        return json_encode($result);
    }

    public static function addOne($id)
    {
        $id = intval($id);

        $productsInCart = array();

        if (isset($_SESSION['products'])) {
            $productsInCart = $_SESSION['products'];
        }

        if (!array_key_exists($id, $productsInCart)) {
            $productsInCart[$id] = 1;
        } else {
            unset($productsInCart[$id]);
        }

        $_SESSION['products'] = $productsInCart;

        return json_encode($productsInCart);
    }

    public static function deleteOneProduct($id)
    {
        $id = intval($id);

        $productsInCart = array();

        if (isset($_SESSION['products'])) {
            $productsInCart = $_SESSION['products'];
        }

        if (array_key_exists($id, $productsInCart)) {
            if ($productsInCart[$id] > 1) {
                $productsInCart[$id] -= 1;
            }
        }

        $_SESSION['products'] = $productsInCart;
    }

    public static function countItems()
    {
        if (isset($_SESSION['products'])) {
            $count = 0;
            foreach ($_SESSION['products'] as $id => $quantity) {
                $count = $count + $quantity;
            }
            return $count;
        } else {
            return 0;
        }
    }

    public static function getProducts()
    {
        if (isset($_SESSION['products'])) {
            return $_SESSION['products'];
        }
        return false;
    }

    public static function getTotalPrice($products)
    {
        $productsInCart = self::getProducts();

        $total = 0;
        if ($productsInCart) {
            foreach ($products as $item) {
                $total += $item['price'] * $productsInCart[$item['id']];
            }
        }

        return $total;
    }

    public static function getPrice()
    {
        $productsInCart = self::getProducts();

        $totalPrice = 0;

        $products = array();

        if ($productsInCart != null) {
            $productsIds = array_keys($productsInCart);

            $products = ProductRepository::getProductsByIds($productsIds);

            $totalPrice = self::getTotalPrice($products);
        }

        return number_format($totalPrice, 2, '.', '');
    }

    public static function clear()
    {
        if (isset($_SESSION['products'])) {
            unset($_SESSION['products']);
        }
    }

    public static function deleteProduct($id)
    {
        $productsInCart = self::getProducts();

        unset($productsInCart[$id]);

        $_SESSION['products'] = $productsInCart;
    }
}
