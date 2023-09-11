<?php include ROOT . '/view/layouts/header-admin.php'; ?>
<div class="content-body">
    <div class="container-fluid">
        <!-- row -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Order#<?= $orders[0]['order_id'] ?></h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="example2" class="display" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                        <th>Weight</th>
                                        <th>Availability</th>
                                        <th>Brand</th>
                                        <th>Sale Percent</th>
                                        <th>Old Price</th>
                                        <th>Current Price</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <? foreach ($products as $product) : ?>
                                        <tr class="table-row" data-id="department<?= $product['id'] ?>">
                                            <td><?= $product['id'] ?></td>
                                            <td><?= $product['name'] ?></td>
                                            <td>x <?= $productsQuantity[$product['id']] ?></td>
                                            <td><?= $product['weight'] ?>kg</td>
                                            <td><? if ($product['availability'] == 1) echo 'In Stock';
                                                else 'Not Available' ?></td>
                                            <td><?= $product['brand'] ?></td>
                                            <td><? if ($product['is_sale'] == 1) echo $product['sale_percent'];
                                                else echo 0 ?>%</td>
                                            <td><? if ($product['is_sale'] == 1) echo '$' . $product['old_price'];
                                                    else echo '-' ?></td>
                                            <td>$<?= $product['price'] ?></td>
                                            <td><?= $product['status'] ?></td>
                                        </tr>
                                    <? endforeach ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                        <th>Weight</th>
                                        <th>Availability</th>
                                        <th>Brand</th>
                                        <th>Sale Percent</th>
                                        <th>Old Price</th>
                                        <th>Current Price</th>
                                        <th>Status</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include ROOT . '/view/layouts/footer-admin.php'; ?>