<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ogani - Admin Dashboard </title>
    <link href="/template/admin/css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/@mdi/font@7.1.96/css/materialdesignicons.min.css">
    <link href="/template/admin/css/style.css" rel="stylesheet">
</head>

<body>

    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>

    <div id="main-wrapper">

        <div class="nav-header">
            <a href="/admin" class="brand-logo">
                <img class="logo-abbr" src="/upload/img/admin/logo.png" alt="">
                <img class="logo-compact" src="/upload/img/admin/logo-text.png" alt="">
                <img class="brand-title" src="/upload/img/admin/logo-text.png" alt="">
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>

        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="search_bar dropdown">
                                <span class="search_icon p-3 c-pointer" data-toggle="dropdown">
                                    <i class="mdi mdi-magnify"></i>
                                </span>
                                <div class="dropdown-menu p-0 m-0">
                                    <form>
                                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">List of Actitons</li>

                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-web"></i><span class="nav-text">Main</span></a>
                        <ul aria-expanded="false">
                            <li><a href="/admin">Main Menu</a></li>
                            <li><a href="/">Website</a></li>
                        </ul>
                    </li>

                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-package-variant-closed"></i><span class="nav-text">Products</span></a>
                        <ul aria-expanded="false">
                            <li><a href="/admin/product">Change Products</a></li>
                            <li><a href="/admin/product/create">Create Products</a></li>
                        </ul>
                    </li>

                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="icon icon-app-store"></i><span class="nav-text">Categories</span></a>
                        <ul aria-expanded="false">
                            <li><a href="/admin/categories">Change Category</a></li>
                            <li><a href="/admin/categories/create">Create Category</a></li>
                        </ul>
                    </li>

                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-source-branch"></i><span class="nav-text">Departments</span></a>
                        <ul aria-expanded="false">
                            <li><a href="/admin/department">Change Department</a></li>
                            <li><a href="/admin/department/create">Create Department</a></li>
                        </ul>
                    </li>

                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-book-check-outline"></i></i><span class="nav-text">Orders</span></a>
                        <ul aria-expanded="false">
                            <li><a href="/admin/order">Change Orders</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->