<? include_once(ROOT . '/view/layouts/header.php'); ?>

</div>
</div>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/upload/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Organi Shop</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Department</h4>
                        <ul>
                            <? foreach ($this->departments as $department) : ?>
                                <li><a href="/shop/<?= $department['category_id']; ?>/department-<?= $department['id']; ?>" class="<? if ($this->departmentId == $department['id']) echo 'active'; ?>"><?= $department['name']; ?></a></li>
                            <? endforeach; ?>
                        </ul>
                    </div>
                    <div class="sidebar__item">
                        <h4>Price</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" data-min="0" data-max="200" class="filter-btn">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount" class="filter-btn" data-filter="price" />
                                    <input type="text" id="maxamount" class="filter-btn" data-filter="price" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar__item sidebar__item__color--option">
                        <h4>Colors</h4>
                        <div class="sidebar__item__color sidebar__item__color--white">
                            <label for="white">
                                White
                                <input type="radio" id="white" class="filter-btn" data-filter="color" data-value="white" />
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--gray">
                            <label for="yellow">
                                Yellow
                                <input type="radio" id="yellow" class="filter-btn" data-filter="color" data-value="yellow" />
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--red">
                            <label for="red">
                                Red
                                <input type="radio" id="red" class="filter-btn" data-filter="color" data-value="red" />
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--black">
                            <label for="black">
                                Black
                                <input type="radio" id="black" class="filter-btn" data-filter="color" data-value="black" />
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--blue">
                            <label for="blue">
                                Blue
                                <input type="radio" id="blue" class="filter-btn" data-filter="color" data-value="blue" />
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--green">
                            <label for="green">
                                Green
                                <input type="radio" id="green" class="filter-btn" data-filter="color" data-value="green" />
                            </label>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <h4>Popular Size</h4>
                        <div class="sidebar__item__size">
                            <label for="large">
                                Large
                                <input type="radio" id="large" class="filter-btn" data-filter="size" data-value="large" />
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="medium">
                                Medium
                                <input type="radio" id="medium" class="filter-btn" data-filter="size" data-value="medium" />
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="small">
                                Small
                                <input type="radio" id="small" class="filter-btn" data-filter="size" data-value="small" />
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="tiny">
                                Tiny
                                <input type="radio" id="tiny" class="filter-btn" data-filter="size" data-value="tiny" />
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Sale Off</h2>
                    </div>
                    <div class="row">
                        <? if (count($this->saleProducts) > 0) : ?>
                            <div class="product__discount__slider owl-carousel">
                                <? foreach ($this->saleProducts as $saleProduct) : ?>
                                    <div class="col-lg-4">
                                        <div class="product__discount__item">
                                            <div class="product__discount__item__pic set-bg" data-setbg="<?= ProductService::getImage($saleProduct['id']) ?>">
                                                <div class="product__discount__percent">
                                                    -<?= $saleProduct['sale_percent']; ?>%
                                                </div>
                                                <ul class="product__item__pic__hover">
                                                    <li>
                                                        <a href="/product/<?= $saleProduct['id']; ?>"><i class="fa fa-info"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="/cart/add/<?= $saleProduct['id'] ?>" data-id="<?= $saleProduct['id'] ?>" class="add-one"><i class="icon_cart<?= isset($productsInCart[$saleProduct['id']]) ? '' : '_alt' ?>"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="product__discount__item__text">
                                                <span><?= $saleProduct['name']; ?></span>
                                                <h5><a href="/product/<?= $saleProduct['id']; ?>"><?= $saleProduct['name']; ?></a></h5>
                                                <div class="product__item__price">
                                                    $<?= $saleProduct['price']; ?> <span>$<?= $saleProduct['old_price']; ?></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <? endforeach; ?>
                            </div>
                        <? else : ?>
                            <h2>No products on sale</h2>
                        <? endif ?>
                    </div>
                </div>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>Sort By</span>
                                <select id="order" name="select">
                                    <option value="0">Name</option>
                                    <option value="1">Price</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span><?= $this->total; ?></span> Products found</h6>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="filter">
                    <ul id="sort" class="col-lg-12 d-flex flex-wrap list-unstyled position-relative">
                        <? foreach ($products as $product) : ?>
                            <li class="col-lg-4 col-md-6 col-sm-6 product__item">
                                <div class="product__item__pic set-bg" data-setbg="<?= ProductService::getImage($product['id']) ?>">
                                    <ul class="product__item__pic__hover">
                                        <li>
                                            <a href="/product/<?= $product['id']; ?>"><i class="fa fa-info"></i></a>
                                        </li>
                                        <li>
                                            <a href="/cart/add/<?= $product['id'] ?>" data-id="<?= $product['id'] ?>" class="add-one"><i class="icon_cart<?= isset($productsInCart[$saleProduct['id']]) ? '' : '_alt' ?>"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="/product/<?= $product['id']; ?>"><?= $product['name']; ?></a></h6>
                                    <h5>$<?= $product['price'] ?></h5>
                                </div>
                            </li>
                        <? endforeach; ?>
                    </ul>
                </div>
                <?= $pagination->get(); ?>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->


<? include_once ROOT . '/view/layouts/footer.php'; ?>