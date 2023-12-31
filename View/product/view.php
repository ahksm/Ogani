<? include_once ROOT . '/view/layouts/header.php' ?>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/upload/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2><?= $product['name'] ?></h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <a href="/shop/<? for ($i = 0; $i < count($this->departments); $i++)
                                                if ($product['department_id'] == $this->departments[$i]['id']) echo $this->departments[$i]['category_id'];
                                            ?>/department-<? for ($i = 0; $i < count($this->departments); $i++)
                                                                if ($product['department_id'] == $this->departments[$i]['id']) echo $this->departments[$i]['id'];
                                                            ?>"><? for ($i = 0; $i < count($this->departments); $i++)
                                                                    if ($product['department_id'] == $this->departments[$i]['id']) echo $this->departments[$i]['name'];
                                                                ?></a>
                        <span><?= $product['name'] ?></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large" src="<?= ProductService::getImage($product['id']) ?>" alt="">
                    </div>
                    <div class="product__details__pic__slider owl-carousel">
                        <img data-imgbigurl="/upload/img/product/details/product-details-2.jpg" src="/upload/img/product/details/thumb-1.jpg" alt="">
                        <img data-imgbigurl="/upload/img/product/details/product-details-3.jpg" src="/upload/img/product/details/thumb-2.jpg" alt="">
                        <img data-imgbigurl="/upload/img/product/details/product-details-5.jpg" src="/upload/img/product/details/thumb-3.jpg" alt="">
                        <img data-imgbigurl="/upload/img/product/details/product-details-4.jpg" src="/upload/img/product/details/thumb-4.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3><?= $product['name'] ?></h3>
                    <div class="product__details__rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <span>(18 reviews)</span>
                    </div>
                    <div class="product__details__price">$<?= $product['price'] ?></div>
                    <p>Short description <?= $product['short_descr'] ?></p>
                    <div class="product__details__quantity">
                        <div class="quantity">
                            <div class="pro-qty">
                                <span class="dec qtybtn">-</span>
                                <input type="text" value="1" data-id="<?= $product['id'] ?>">
                                <span class="inc qtybtn">+</span>
                            </div>
                        </div>
                    </div>
                    <a href="/cart/addAjax/<?= $product['id'] ?>" class="primary-btn add-to-cart multiple" data-id="<?= $product['id'] ?>">ADD TO CARD</a>
                    <ul>
                        <li><b>Availability</b> <span>In Stock</span></li>
                        <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                        <li><b>Weight</b> <span><?= $product['weight'] ?> kg</span></li>
                        <li><b>Share on</b>
                            <div class="share">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false">Information</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab" aria-selected="false">Reviews <span>(1)</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Products Description</h6>
                                <p>Description <?= $product['long_descr']; ?></p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Products Infomation</h6>
                                <p>Information <?= $product['info'] ?></p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Products Reviews</h6>
                                <p>Review <?= $product['review'] ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Related Product</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <? foreach ($related as $product) : ?>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<?= ProductService::getImage($product['id']) ?>">
                            <ul class="product__item__pic__hover">
                                <li><a href="/product/<?= $product['id'] ?>"><i class="fa fa-info"></i></a></li>
                                <li><a href="#"><span class="icon_cart_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="/product/<?= $product['id'] ?>"><?= $product['name'] ?></a></h6>
                            <h5>$<?= $product['price'] ?></h5>
                        </div>
                    </div>
                </div>
            <? endforeach; ?>
        </div>
    </div>
</section>
<!-- Related Product Section End -->

<? include_once ROOT . '/view/layouts/footer.php' ?>