<?php

class CartController extends BaseController
{
    private $userService;
    private $orderService;

    public function __construct()
    {
        $this->userService = new UserService(new UserRepository);
        $this->orderService = new OrderService(new OrderRepository);
    }

    public function actionAdd($id)
    {
        echo CartService::addOne($id);
        return true;
    }

    public function actionAddAjax($id, $num)
    {
        echo CartService::addProduct($id, $num);
        return true;
    }

    public function actionDelete($id, $isAll)
    {
        if ($isAll == 0) {
            CartService::deleteProduct($id);
        } elseif ($isAll == 1) {
            if ($this->productsInCart[$id] > 1) {
                CartService::deleteOneProduct($id);
            } else {
                CartService::deleteProduct($id);
            }
        }

        $productsInCart2 = CartService::getProducts();

        $products = array();

        $totalPrice = 0;

        if ($productsInCart2) {
            $productsIds = array_keys($productsInCart2);

            $products = ProductRepository::getProductsByIds($productsIds);
        }

        foreach ($productsInCart2 as $product => $value) {
            for ($i = 0; $i < count($products); $i++) {
                if ($product == $products[$i]['id']) {
                    array_push($products[$i], (object)['amount' => $value]);
                }
            }
        }

        echo json_encode($products);

        return true;
    }

    public function actionIndex()
    {
        $headerPage = 'pages';

        $headerPage2 = 'cart';

        $totalPrice = 0;

        $products = array();

        $productsInCart = CartService::getProducts();

        if ($productsInCart != null) {
            $productsIds = array_keys($productsInCart);

            $products = ProductRepository::getProductsByIds($productsIds);

            $totalPrice = CartService::getTotalPrice($products);
        }

        require_once(ROOT . '/view/cart/index.php');

        return true;
    }

    public function actionCheckout()
    {
        $headerPage = 'pages';

        $headerPage2 = 'cart';

        $productsInCart = CartService::getProducts();

        if ($productsInCart == false) {
            header("Location: /");
        }

        $productsIds = array_keys($productsInCart);
        $products = ProductRepository::getProductsByIds($productsIds);
        $totalPrice = CartService::getTotalPrice($products);

        for ($i = 0; $i < count($products); $i++) {
            $productsInfo[$i] = array(
                'product_id' => $products[$i]['id'],
                'quantity' => $productsInCart[$products[$i]['id']],
                'price' => $products[$i]['price'],
                'total_price' => $products[$i]['price'] * $productsInCart[$products[$i]['id']]
            );
        }

        foreach ($productsInCart as $product => $value) {
            for ($i = 0; $i < count($products); $i++) {
                if ($product == $products[$i]['id']) {
                    array_push($products[$i], (object)['amount' => $value]);
                }
            }
        }

        if (!UserService::isGuest()) {
            $userId = UserService::checkLogged();
            $user = UserRepository::getUserById($userId);
        }

        if (isset($_POST['submit'])) {
            $user = User::request($_POST);
            $order = Order::request($_POST);
            $errors = $this->orderService->validateOrder($order);

            if ($errors == null) {
                $lightbox = true;
                var_dump($user);
                $userId = !$errors ? $this->userService->register($user) : false;

                $lastId = OrderRepository::create($userId, $_POST['comment']);
                foreach ($productsInfo as $product) {
                    $result = OrderRepository::createProductInfo($lastId, $product['product_id'], $product['quantity'], $product['price'], $product['total_price']);
                }
            }
        }

        if (isset($_POST['submit2'])) {
            CartService::clear();
            header("Location: /");
        }

        require_once(ROOT . '/view/cart/checkout.php');

        return true;
    }
}
