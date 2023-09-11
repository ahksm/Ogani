<?php

class BaseController
{
    protected $departments;
    protected $categories;
    protected $someRandomProduct;
    protected $totalPrice;
    protected $productsInCart;
    protected $total;
    protected $saleProducts;
    protected $categoryId;
    protected $departmentId;
    protected $totalQuantity;

    public function __construct()
    {
        $this->departments = CategoryRepository::getDeptList();
        $this->categories = CategoryRepository::getCatList();
        $randomProduct = ProductRepository::getRandomProduct();
        $this->someRandomProduct = $randomProduct ? $randomProduct['id'] : null;
        $this->totalPrice = CartService::getPrice();
        $this->productsInCart = CartService::getProducts();
        $this->total = ProductRepository::getTotalProducts();
        $this->saleProducts = ProductRepository::getSaleProducts(9);
        $this->categoryId = false;
        $this->departmentId = false;
        $this->totalQuantity = CartService::countItems();
    }
}
