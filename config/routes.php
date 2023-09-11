<?php

return array(
    // Product:
    'product/([0-9]+)' => 'product/view/$1', // actionView in ProductController
    // Department:
    'shop/([0-9]+)/department-([0-9]+)/page-([0-9]+)' => 'site/department/$1/$2/$3', // actionDepartment in SiteController
    'shop/([0-9]+)/department-([0-9]+)' => 'site/department/$1/$2', // actionDepartment in SiteController
    // Shop:
    'shop/([0-9]+)/page-([0-9]+)' => 'site/category/$1/$2', // actionCategory in SiteController
    'shop/([0-9]+)' => 'site/category/$1', // actionCategory in SiteController
    'shop/page-([0-9]+)' => 'site/index/$1', // actionCategory in SiteController
    'shop' => 'site/shop', // actionCategory in SiteController
    // Cart:
    'cart/checkout' => 'cart/checkout', // actionCheckout in CartController
    'cart/delete/([0-9]+)/([0-9]+)' => 'cart/delete/$1/$2', // actionDelete in CartController    
    'cart/addAjax/([0-9]+)/([0-9]+)' => 'cart/addAjax/$1/$2', // actionAddAjax in CartController
    'cart/add/([0-9]+)' => 'cart/add/$1', // actionAdd in CartController
    'cart' => 'cart/index', // actionIndex in CartController
    // Filter:
    'productsFilter/page-([0-9]+)' => 'filter/productsFilter/$1', // actionFilter in FilterController
    'productsFilter' => 'filter/productsFilter', // actionFilter in FilterController
    // User:
    'user/register' => 'user/register', // actionRegister in UserController
    'login' => 'user/login', // actionLogin in UserController
    'user/logout' => 'user/logout', // actionLogout in UserController
    'cabinet' => 'user/update', // actionUpdate in UserController
    // Admin Product:    
    'admin/product/create' => 'product/create', // actionCreate in ProductController
    'admin/product/update/([0-9]+)' => 'product/update/$1', // actionUpdate in ProductController
    'admin/product/delete/([0-9]+)' => 'product/delete/$1', // actionDelete in ProductController
    'admin/product' => 'product/admin', // actionIndex in ProductController
    // Admin Category:    
    'admin/categories/create' => 'category/createCat', // actionCreate in CategoryController
    'admin/categories/update/([0-9]+)' => 'category/updateCat/$1', // actionUpdate in CategoryController
    'admin/categories/delete/([0-9]+)' => 'category/deleteCat/$1', // actionDelete in CategoryController
    'admin/categories' => 'category/category', // actionIndex in CategoryController
    // Admin Department:
    'admin/department/create' => 'category/createDept', // actionCreate in CategoryController
    'admin/department/update/([0-9]+)' => 'category/updateDept/$1', // actionUpdate in CategoryController
    'admin/department/delete/([0-9]+)' => 'category/deleteDept/$1', // actionDelete in CategoryController
    'admin/department' => 'category/department', // actionIndex in CategoryController
    // Admin Order:    
    'admin/order/delete/([0-9]+)' => 'order/delete/$1', // actionDelete in OrderController
    'admin/order/delete' => 'order/delete', // actionDelete in OrderController
    'admin/order/view/([0-9]+)' => 'order/view/$1', // actionView in OrderController
    'admin/order' => 'order/index', // actionIndex in OrderController
    // Admin Panel:
    'admin' => 'admin/index', // actionIndex in AdminController
    // Main:
    'index.php' => 'site/index', // actionIndex in SiteController
    '' => 'site/index', // actionIndex in SiteController
);
