<?php

class SiteController extends BaseController
{

    public function actionIndex()
    {
        $headerPage = 'home';

        $products = ProductRepository::getProducts();

        require_once(ROOT . '/view/site/index.php');

        return true;
    }

    public function actionShop($page = 1)
    {
        $headerPage = 'shop';

        $products = ProductRepository::getProductsList($page);

        $pagination = new Pagination($this->total, $page, Product::SHOW_BY_DEFAULT, 'page-');

        require_once(ROOT . '/view/shop/index.php');
        
        return true;
    }

    public function actionDepartment($catId, $deptId, $page = 1)
    {
        $headerPage = 'shop';

        $this->categoryId = $catId;

        $this->departmentId = $deptId;

        $departmentsByCat = CategoryRepository::getDeptListByCategory($catId);

        $saleProducts = ProductRepository::getSaleProducts(9, null, $deptId);
        $saleProducts = array_chunk($saleProducts, 3);

        $total = ProductRepository::getTotalProducts(null, $deptId);

        $pageProducts = ProductRepository::getProductsList($page, null, $deptId);

        $pagination = new Pagination($total, $page, Product::SHOW_BY_DEFAULT, 'page-');

        require_once(ROOT . '/view/shop/department.php');
        
        return true;
    }

    public function actionCategory($catId, $page = 1)
    {
        $headerPage = 'shop';

        $this->categoryId = $catId;

        $departmentsByCat = CategoryRepository::getDeptListByCategory($catId);

        $saleProducts = ProductRepository::getSaleProducts(9, $catId);
        $saleProducts = array_chunk($saleProducts, 3);

        $total = ProductRepository::getTotalProducts($catId);

        $pageProducts = ProductRepository::getProductsList($page, $catId);

        $pagination = new Pagination($total, $page, Product::SHOW_BY_DEFAULT, 'page-');

        require_once(ROOT . '/view/shop/category.php');
        
        return true;
    }
}
