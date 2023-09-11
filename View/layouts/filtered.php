<div class="row" id="filter">
    <ul id="sort" class="col-lg-12 d-flex flex-wrap list-unstyled">
        <? foreach ($results2 as $product) : ?>
            <li class="col-lg-4 col-md-6 col-sm-6 product__item">
                <div class="product__item__pic set-bg" data-setbg="<?= ProductService::getImage($product['id']) ?>">
                    <ul class="product__item__pic__hover">
                        <li>
                            <a href="/product/<?= $product['id']; ?>"><i class="fa fa-info"></i></a>
                        </li>
                        <li>
                            <a href="/cart/addAjax/<?= $product['id'] ?>/1" data-id="<?= $product['id'] ?>" class="add-to-cart"><span class="icon_cart_alt"></span></a>
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