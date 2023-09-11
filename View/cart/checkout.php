<? include_once ROOT . '/view/layouts/header.php' ?>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/upload/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Checkout</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>Checkout</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>Billing Details</h4>
            <form action="" method="POST">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <?php
                        $fields = [
                            'firstName' => ['label' => 'First Name'],
                            'lastName' => ['label' => 'Last Name'],
                            'country' => ['label' => 'Country/State'],
                            'city' => ['label' => 'Town/City'],
                            'streetAddress' => ['label' => 'Street Address'],
                            'apartmentAddress' => ['label' => 'Apartment Address'],
                            'zip' => ['label' => 'Postcode / ZIP'],
                            'phone' => ['label' => 'Phone'],
                            'email' => ['label' => 'Email', 'type' => 'email'],
                            'username' => ['label' => 'Username'],
                            'password' => ['label' => 'Password', 'type' => 'password'],
                            'confirm_password' => ['label' => 'Confirm Password', 'type' => 'password']
                        ];

                        foreach ($fields as $fieldName => $fieldInfo) {
                            $label = $fieldInfo['label'];
                            $inputType = $fieldInfo['type'] ?? 'text';
                            $value = isset(${$fieldName}) ? ${$fieldName} : '';

                            include(ROOT . '/view/components/input.php');
                        }
                        ?>
                        <div class="checkout__input__checkbox">
                            <label for="diff-acc">
                                Ship to a different address?
                                <input type="checkbox" id="diff-acc">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="checkout__input">
                            <p>Order notes</p>
                            <input name="comment" type="text" placeholder="Notes about your order, e.g. special notes for delivery.">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Your Order</h4>
                            <div class="checkout__order__products">Products <span>Total</span></div>
                            <ul>
                                <? foreach ($products as $product) : ?>
                                    <li><?= $product['name'] ?> x <?= $productsInCart[$product['id']] ?> <span>$<?= $productsInCart[$product['id']] * $product['price'] ?></span></li>
                                <? endforeach; ?>
                            </ul>
                            <div class="checkout__order__subtotal">Subtotal <span>$<?= $totalPrice ?></span></div>
                            <div class="checkout__order__total">Total <span>$<?= $totalPrice ?></span></div>
                            <button name="submit" type="submit" class="site-btn">PLACE ORDER</button>
                            <? if (isset($lightbox)) : ?>
                                <div class="lightbox active">
                                    <div class="content">
                                        <i class="fa-regular fa-circle-check"></i>
                                        <h2>Confirmed!</h2>
                                        <button name="submit2" type="submit" class="site-btn">OK</button>
                                    </div>
                                </div>
                            <? endif; ?>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<? include_once ROOT . '/view/layouts/footer.php' ?>