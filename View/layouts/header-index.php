<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="/upload/img/logo.png" type="image/x-icon">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/template/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/template/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/template/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/template/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/template/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/template/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/template/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/template/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="/upload/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <? if (CartService::countItems() <= 0) : ?>
                    <li><a href="/cart" class="cart"><i class="icon_bag_alt"></i> <span class="cart-count"><?= CartService::countItems() ?></span></a></li>
                <? else : ?>
                    <li><a href="/cart" class="cart"><i class="icon_bag"></i> <span class="cart-count"><?= CartService::countItems() ?></span></a></li>
                <? endif ?>
            </ul>
            <div class="header__cart__price">Item: <span>$<?= $this->totalPrice ?></span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="/upload/img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <? if (UserService::isGuest()) : ?>
                <div class="header__top__right__auth">
                    <div class="log">
                        <a href="/login/"><i class="fa fa-user"></i> Login</a>
                        <a href="/user/register/"><i class="fa fa-sign-in"></i> Register</a>
                    </div>
                </div>
            <? else : ?>
                <div class="header__top__right__auth">
                    <div class="log">
                        <a href="/cabinet/"><i class="fa fa-user"></i> Account</a>
                        <a href="/user/logout/"><i class="fa fa-sign-out"></i> Logout</a>
                    </div>
                </div>
            <? endif; ?>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="<? if (isset($headerPage)) if ($headerPage == 'home') echo 'active' ?>"><a href="/">Home</a></li>
                <li class="<? if (isset($headerPage)) if ($headerPage == 'shop') echo 'active' ?>"><a href="/shop/">Shop</a></li>
                <li class="<? if (isset($headerPage)) if ($headerPage == 'pages') echo 'active' ?>"><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="/product/<?= $this->someRandomProduct; ?>" class="<? if (isset($headerPage)) if ($headerPage == 'pages') if ($headerPage2 == 'product') echo 'active' ?>">Product Details</a></li>
                        <li><a href="/cart" class="<? if (isset($headerPage)) if ($headerPage == 'pages') if ($headerPage2 == 'cart') echo 'active' ?>">Shoping Cart</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="/upload/img/language.png" alt="">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <? if (UserService::isGuest()) : ?>
                                <div class="header__top__right__auth">
                                    <div class="log">
                                        <a href="/login/"><i class="fa fa-user"></i> Login</a>
                                        <a href="/user/register/"><i class="fa fa-sign-in"></i> Register</a>
                                    </div>
                                </div>
                            <? else : ?>
                                <div class="header__top__right__auth">
                                    <div class="log">
                                        <a href="/cabinet/"><i class="fa fa-user"></i> Account</a>
                                        <a href="/user/logout/"><i class="fa fa-sign-out"></i> Logout</a>
                                    </div>
                                </div>
                            <? endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/"><img src="/upload/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="<? if (isset($headerPage)) if ($headerPage == 'home') echo 'active' ?>"><a href="/">Home</a></li>
                            <li class="<? if (isset($headerPage)) if ($headerPage == 'shop') echo 'active' ?>"><a href="/shop/">Shop</a></li>
                            <li class="<? if (isset($headerPage)) if ($headerPage == 'pages') echo 'active' ?>"><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="/product/<?= $this->someRandomProduct; ?>" class="<? if (isset($headerPage)) if ($headerPage == 'pages') if ($headerPage2 == 'product') echo 'active' ?>">Product Details</a></li>
                                    <li><a href="/cart" class="<? if (isset($headerPage)) if ($headerPage == 'pages') if ($headerPage2 == 'cart') echo 'active' ?>">Shoping Cart</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <? if (CartService::countItems() <= 0) : ?>
                                <li><a href="/cart" class="cart"><i class="icon_bag_alt"></i> <span class="cart-count"><?= CartService::countItems() ?></span></a></li>
                            <? else : ?>
                                <li><a href="/cart" class="cart"><i class="icon_bag"></i> <span class="cart-count"><?= CartService::countItems() ?></span></a></li>
                            <? endif ?>
                        </ul>
                        <div class="header__cart__price">Item: <span>$<?= $this->totalPrice ?></span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <? foreach ($this->departments as $department) : ?>
                                <li><a href="/shop/<?= $department['category_id']; ?>/department-<?= $department['id']; ?>"><?= $department['name']; ?></a></li>
                            <? endforeach; ?>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories hero-normal">
                                    <div class="hero__search__categories__all">
                                        All Categories
                                        <span class="arrow_carrot-down"></span>
                                    </div>
                                    <ul>
                                        <? foreach ($this->categories as $category) : ?>
                                            <li>
                                                <a href="/shop/<?= $category['id']; ?>"><?= $category['name']; ?></a>
                                            </li>
                                        <? endforeach; ?>
                                    </ul>
                                </div>
                                <input id="search" type="text" placeholder="What do you need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                            <div id="main_results"><div class="overflow"></div></div>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="/upload/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="/shop/page-1" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->