<!-- Footer Section Begin -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="/"><img src="/upload/img/logo.png" alt=""></a>
                    </div>
                    <ul>
                        <li>Address: 60-49 Road 11378 New York</li>
                        <li>Phone: +65 11.188.888</li>
                        <li>Email: hello@colorlib.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>Useful Links</h6>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">About Our Shop</a></li>
                        <li><a href="#">Secure Shopping</a></li>
                        <li><a href="#">Delivery infomation</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Our Sitemap</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">Who We Are</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="#">Projects</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Innovation</a></li>
                        <li><a href="#">Testimonials</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Join Our Newsletter Now</h6>
                    <p>Get E-mail updates about our latest shop and special offers.</p>
                    <form action="#">
                        <input type="text" placeholder="Enter your mail">
                        <button type="submit" class="site-btn">Subscribe</button>
                    </form>
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text">
                        <p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy; <span class="year"></span> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                    <div class="footer__copyright__payment"><img src="/upload/img/payment-item.png" alt=""></div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="/template/js/jquery-3.3.1.min.js"></script>
<script src="/template/js/bootstrap.min.js"></script>
<script src="/template/js/jquery.nice-select.min.js"></script>
<script src="/template/js/jquery-ui.min.js"></script>
<script src="/template/js/jquery.slicknav.js"></script>
<script src="/template/js/mixitup.min.js"></script>
<script src="/template/js/owl.carousel.min.js"></script>
<script>
    $(document).ready(function() {
        $('.add-one').on('click', function(e) {
            e.preventDefault();
            const id = $(this).data('id');
            $.post('/cart/add/' + id, {}, function(res) {
                const data = JSON.parse(res);
                const icon = data.hasOwnProperty(id) ? 'icon_cart' : 'icon_cart_alt';
                $(`.add-one[data-id="${id}"]`).html(`<i class="${icon}"></i>`);
                $('.cart').html(`<i class="icon_bag${Object.keys(data).length ? '' : '_alt'}"></i><span>${Object.keys(data).length}</span>`);
            });
        });

        $('.add-to-cart').click(function() {
            const btn = $(this),
                id = btn.attr('data-id'),
                inputVal = btn.siblings('.product__details__quantity').find('input').val(),
                qty = btn.hasClass('multiple') ? inputVal : 1;
            $.post(`/cart/addAjax/${id}/${qty}`, {}, function(data) {
                const [items, totalCost] = JSON.parse(data);
                $('.cart').html(`<i class="icon_bag"></i><span class="cart-count">${items}</span>`);
                $('.header__cart__price span').html(`$${totalCost.toFixed(2)}`);
                if (!btn.hasClass('multiple')) {
                    $('#subtotal span').html(`$${totalCost}`);
                    $('#total span').html(`$${totalCost}`);
                    let newVal = btn.siblings('input'),
                        oldValue = newVal.val(),
                        inc = btn.hasClass("inc"),
                        price = btn.parent().parent().parent().siblings(".shoping__cart__price"),
                        total = btn.parent().parent().parent().siblings(".shoping__cart__total");
                    inc && oldValue < 100 ? newVal.val(++oldValue) : newVal.val(100);
                    total.html(`$${(newVal.val() * price.html().trim().slice(1)).toFixed(2)}`);
                }
            });
            return false;
        });

        $('.icon_close').click(function() {
            const id = $(this).data('id');
            $(this).closest('tr').remove();
            if (!$('#cart-table').html().trim()) $('#cart-table').html('<tr><th>Your cart is empty</th></tr>');
            $.post(`/cart/delete/${id}/0`, {}, function(data) {
                const info = JSON.parse(data);
                const price = info.reduce((t, i) => t + i.price * i[0].amount, 0);
                const count = info.reduce((total, item) => total + Number(item[0].amount), 0);

                $('.cart').html(`<i class="icon_bag${count > 0 ? '' : '_alt'}"></i><span class="cart-count">${count || 0}</span>`);
                $('.header__cart__price span, #subtotal span, #total span').html(`$${price}`);
            });
            return false;
        });

        $('.dec').click(function() {
            const btn = $(this),
                id = btn.data('id'),
                tr = $('tr');
            if (btn.hasClass('delete-from-cart')) {
                $.post(`/cart/delete/${id}/1`, {}, function(data) {
                    const info = JSON.parse(data),
                        price = info.reduce((a, c) => a + c.price * c[0].amount, 0),
                        count = info.reduce((a, c) => a + Number(c[0].amount), 0);
                    $('.cart').html(count ? '<i class="icon_bag"></i><span class="cart-count"></span>' : '<i class="icon_bag_alt"></i><span class="cart-count"></span>');
                    $('.cart-count').html(count);
                    $('.header__cart__price span').html('$' + price.toFixed(2));
                    $('#subtotal').html(`Subtotal <span>$${price.toFixed(2)}</span>`);
                    $('#total').html(`Total <span>$${price.toFixed(2)}</span>`);
                    const newVal = btn.siblings('input'),
                        oldValue = newVal.val();
                    if (oldValue > 1) newVal.val(oldValue - 1);
                    else {
                        if (!$.trim($('#cart-table').html())) $('#cart-table').html('<tr><th>Your cart is empty</th></tr>');
                        newVal.val(0);
                    }
                    if (btn.siblings("input").hasClass("cartInput")) {
                        const price = btn.parent().parent().parent().siblings(".shoping__cart__price"),
                            total = btn.parent().parent().parent().siblings(".shoping__cart__total");
                        total.html(`$${(newVal.val() * price.html().trim().slice(1)).toFixed(2)}`);
                    }
                });
            } else {
                const newVal = btn.siblings('input'),
                    oldValue = newVal.val();
                if (oldValue > 1) newVal.val(oldValue - 1);
                else newVal.val(0);
            }
            return false;
        });

        let session = "<?= isset($_SESSION['user']) ? 'disabled' : '' ?>";
        let nosession = "<?= isset($_SESSION['user']) ? '' : 'disabled' ?>";

        $('#acc, #acc-or').on('change', function() {
            let checked = $(this).prop('checked');
            $('#acc, #acc-or').prop('checked', checked);

            let html = checked ?
                `<p>Username<span>*</span></p><input name="username" type="text" ${session}>
                 <p>Password<span>*</span></p><input name="password" type="password" ${session}>
                 <p>Confirm Password<span>*</span></p><input name="confirm_password" type="password" ${session}>` :
                `<p>Account Password<span>*</span></p><input name="password" type="password" ${nosession}>`;
            $('#accountPassword').html(html);
        });

        $("#search").on("keyup", function(e) {
            $.post("/search.php", {
                q: $(this).val()
            }, function(data) {
                $("#main_results .overflow").html(data);
                $('#main_results').toggle(Boolean(e.target.value));
            });
        });


        $(document).on('click', '.filter-btn, a[href^="/productsFilter/page-"]', function(e) {
            e.preventDefault();
            var $this = $(this);
            if ($this.hasClass('active')) $this.removeClass('active')
            else {
                $('.filter-btn[type="radio"][data-filter="' + $this.data('filter') + '"]').removeClass('active')
                $this.addClass('active')
            }
            var page = $(this).attr('href') ? $(this).attr('href').match(/\d+/)[0] : 1;
            var filters = $('.filter-btn.active').map(function() {
                return {
                    filter: $(this).data('filter'),
                    value: $(this).data('value')
                };
            }).get();
            $('.product__pagination').remove();

            var loader = $('<div class="loader-bg"><div class="loading"></div></div>');
            $('#sort').append(loader)
            $.post('/productsFilter/page-' + page, {
                filters: JSON.stringify(filters),
                price_min: $("#minamount").val().slice(1),
                price_max: $("#maxamount").val().slice(1),
                order_by: $("#order").val(),
                department: $(this).data('department'),
                category: $(this).data('category'),
            }, function(data) {
                data = JSON.parse(data)
                if (data.results_length > 0) {
                    $('#filter').replaceWith(data.filtered_html);
                    $(".set-bg").css("background-image", function() {
                        return "url(" + $(this).data("setbg") + ")";
                    });
                } else {
                    $('#filter').html('<h3>No results that match your filter!</h3>');
                }
                $('.filter__found h6 span').html(data.results_length);
                loader.hide()
            });
        });

        $(".price-range").slider({
            range: true,
            min: 0,
            max: 200,
            values: [0, 200],
            stop: function(event, ui) {
                $("#minamount").val('$' + ui.values[0]);
                $("#maxamount").val('$' + ui.values[1]);
                var page = $(this).attr('href') ? $(this).attr('href').match(/\d+/)[0] : 1;
                var filters = $('.filter-btn.active').map(function() {
                    return {
                        filter: $(this).data('filter'),
                        value: $(this).data('value')
                    };
                }).get();
                $('.product__pagination').remove();
                var loader = $('<div class="loader-bg"><div class="loading"></div></div>');
                $('#sort').append(loader)
                $.post('/productsFilter/page-' + page, {
                    filters: JSON.stringify(filters),
                    price_min: $("#minamount").val().slice(1),
                    price_max: $("#maxamount").val().slice(1),
                    order_by: $("#order").val(),
                    department: $(this).data('department'),
                    category: $(this).data('category')
                }, function(data) {
                    data = JSON.parse(data)
                    $('#filter').replaceWith(data['filtered_html']);
                    $('.filter__found h6 span').html(data['results_length']);
                    $(".set-bg").css("background-image", function() {
                        return "url(" + $(this).data("setbg") + ")";
                    });
                    loader.hide()
                });
            }
        });

        $("#order").on("change", function(e) {
            e.preventDefault();
            var page = $(this).attr('href') ? $(this).attr('href').match(/\d+/)[0] : 1;
            var filters = $('.filter-btn.active').map(function() {
                return {
                    filter: $(this).data('filter'),
                    value: $(this).data('value')
                };
            }).get();
            $('.product__pagination').remove();

            var loader = $('<div class="loader-bg"><div class="loading"></div></div>');
            $('#sort').append(loader)
            $.post('/productsFilter/page-' + page, {
                filters: JSON.stringify(filters),
                price_min: $("#minamount").val().slice(1),
                price_max: $("#maxamount").val().slice(1),
                order_by: $("#order").val(),
                department: $(this).data('department'),
                category: $(this).data('category')
            }, function(data) {
                data = JSON.parse(data)
                $('#filter').replaceWith(data['filtered_html']);
                $('.filter__found h6 span').html(data['results_length']);
                $(".set-bg").css("background-image", function() {
                    return "url(" + $(this).data("setbg") + ")";
                });
                loader.hide()
            });
        });

    });

    $('.year').html(new Date().getFullYear());
</script>
<script src="/template/js/main.js"></script>

</body>

</html>