<? include_once ROOT . '/view/layouts/header-index.php'; ?>

<!-- Categories Section Begin -->
<section class="categories">
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <? foreach ($this->categories as $category) : ?>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="<?= CategoryService::getImage($category['id']) ?>">
                            <h5><a href="/shop/<?= $category['id']; ?>"><?= $category['name']; ?></a></h5>
                        </div>
                    </div>
                <? endforeach; ?>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Featured Product</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <? foreach ($this->categories as $category) : ?>
                            <li data-filter=".<?= str_replace('&', 'and', str_replace(' ', '_', strtolower($category['name']))); ?>"><?= $category['name']; ?></li>
                        <? endforeach; ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <? foreach ($products as $product) : ?>
                <? foreach ($this->categories as $category) : ?>
                    <? if ($category['id'] == $product['category_id']) : ?>
                        <div class="col-lg-3 col-md-4 col-sm-6 mix <?= str_replace('&', 'and', str_replace(' ', '_', strtolower($category['name']))); ?>">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg" data-setbg="<?= ProductService::getImage($product['id']) ?>">
                                    <ul class="featured__item__pic__hover">
                                        <li><a href="/product/<?= $product['id']; ?>"><i class="fa fa-info"></i></a></li>
                                        <li><a href="/cart/add/<?= $product['id'] ?>" data-id="<?= $product['id'] ?>" class="add-one"><i class="icon_cart<?= isset($this->productsInCart[$product['id']]) ? '' : '_alt' ?>"></i></a></li>
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="/product/<?= $product['id']; ?>"><?= $product['name']; ?></a></h6>
                                    <h5>$<?= $product['price']; ?></h5>
                                </div>
                            </div>
                        </div>
                    <? endif; ?>
                <? endforeach; ?>
            <? endforeach; ?>
        </div>
    </div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner" style="margin-bottom: 40px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="/upload/img/banner/banner-1.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="/upload/img/banner/banner-2.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<? include_once ROOT . '/view/layouts/footer.php'; ?>