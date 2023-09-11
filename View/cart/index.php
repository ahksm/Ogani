<? include_once ROOT . '/view/layouts/header.php' ?>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/upload/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Shopping Cart</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                            <tr>
                                <th class="shoping__product">Products</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="cart-table">
                            <? if ($products == null) : ?>
                                <tr>
                                    <th>Your cart is empty</th>
                                </tr>
                            <? else : ?>
                                <? foreach ($products as $product) : ?>
                                    <tr id="<?= $product['id'] ?>">
                                        <td class="shoping__cart__item">
                                            <img src="<?= ProductService::getImage($product['id']) ?>" alt="">
                                            <h5><?= $product['name'] ?></h5>
                                        </td>
                                        <td class="shoping__cart__price">
                                            $<?= number_format($product['price'], 2, '.', '') ?>
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                                <div class="pro-qty">
                                                    <a href="/cart/delete/<?= $product['id'] ?>/1" class="dec qtybtn delete-from-cart" data-id="<?= $product['id'] ?>">-</a>
                                                    <input type="text" value="<?= $_SESSION['products'][$product['id']]; ?>" data-id="<?= $product['id'] ?>" class="cartInput">
                                                    <a href="/cart/addAjax/<?= $product['id'] ?>/1" class="inc qtybtn add-to-cart" data-id="<?= $product['id'] ?>">+</a>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="shoping__cart__total">
                                            $<?= number_format($product['price'] * $_SESSION['products'][$product['id']], 2, '.', '') ?>
                                        </td>
                                        <td class="shoping__cart__item__close">
                                            <a href="/cart/delete/<?= $product['id'] ?>/0" class="icon_close" data-id="<?= $product['id'] ?>"></a>
                                        </td>
                                    </tr>
                                <? endforeach ?>
                            <? endif ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="/" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                </div>
            </div>
            <div class="col-lg-6">
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Cart Total</h5>
                    <ul>
                        <li id="subtotal">Subtotal <span>$<?= number_format($totalPrice, 2, '.', '') ?></span></li>
                        <li id="total">Total <span>$<?= number_format($totalPrice, 2, '.', '') ?></span></li>
                    </ul>
                    <a href="cart/checkout" class="primary-btn">PROCEED TO CHECKOUT</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->

<? include_once ROOT . '/view/layouts/footer.php' ?>