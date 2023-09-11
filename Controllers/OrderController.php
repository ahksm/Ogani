<?php

class OrderController extends AdminBase
{

    public function actionIndex()
    {
        $ordersList = OrderRepository::getOrdersList();

        require_once(ROOT . '/view/admin_order/index.php');
        return true;
    }

    public function actionView($id)
    {
        $orders = OrderRepository::getOrderProductsById($id);

        for ($i=0; $i < count($orders); $i++) { 
            $productsIds[$i] = $orders[$i]['product_id'];
            $productsQuantity[$orders[$i]['product_id']] = $orders[$i]['quantity'];
        }

        $productsIds = array_values($productsIds);

        $products = ProductRepository::getProductsByIds($productsIds);

        require_once(ROOT . '/view/admin_order/view.php');
        return true;
    }

    public function actionDelete($id)
    {
        OrderRepository::deleteOrderById($id);

        header("Location: /admin/order");

        return true;
    }
}
