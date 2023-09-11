<?php

class ProductController extends BaseController
{
    private $productService;

    public function __construct()
    {
        parent::__construct();
        $this->productService = new ProductService(new ProductRepository);
    }

    public function actionView($id)
    {
        $headerPage = 'pages';

        $headerPage2 = 'product';

        $product = ProductRepository::getProductById($id);

        $availability = ProductService::getAvailabilityText($id);

        $related = ProductRepository::getProductsByCat($id);

        require_once ROOT . '/view/product/view.php';

        return true;
    }

    public function actionAdmin()
    {
        $productsList = ProductRepository::getProducts(true);

        require_once(ROOT . '/view/admin_product/index.php');
        return true;
    }

    public function actionCreate()
    {
        if (isset($_POST['submit'])) {
            $product = Product::request($_POST);
            $errors = $this->productService->validateProduct($product);
            $productId = !$errors ? $this->productService->create($product) : false;

            if ($productId) {
                if (is_uploaded_file($_FILES["image"]["tmp_name"])) {
                    move_uploaded_file($_FILES["image"]["tmp_name"], $_SERVER['DOCUMENT_ROOT'] . "/upload/img/products/{$productId}.jpg");
                }
                header("Location: /admin/product");
            };
        }

        require_once(ROOT . '/view/admin_product/create.php');
        return true;
    }

    public function actionUpdate($id)
    {
        $product = ProductRepository::getProductById($id);

        if (isset($_POST['submit'])) {
            $product = Product::request($_POST);
            $errors = $this->productService->validateProduct($product);
            $productId = !$errors ? $this->productService->update($id, $product) : false;

            if ($productId) {
                if (is_uploaded_file($_FILES["image"]["tmp_name"])) {
                    move_uploaded_file($_FILES["image"]["tmp_name"], $_SERVER['DOCUMENT_ROOT'] . "/upload/img/products/{$productId}.jpg");
                }
                header("Location: /admin/product");
            };
        }

        require_once(ROOT . '/view/admin_product/update.php');
        return true;
    }

    public function actionDelete($id)
    {
        ProductRepository::delete($id);

        header("Location: /admin/product");

        return true;
    }
}
