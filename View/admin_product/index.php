<?php include ROOT . '/view/layouts/header-admin.php'; ?>

<div class="content-body">
    <div class="container-fluid">
        <!-- row -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Products Datatable</h4>
                    </div>
                    <div class="card-body">
                        <div class="dropdown special">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Column Selector
                            </button>
                            <div class="dropdown-menu special" aria-labelledby="dropdownMenuButton">
                                <div id="column-selector" class="d-flex flex-column">
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-1" checked><span class="toggle-switch-slider"></span>ID</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-2" checked><span class="toggle-switch-slider"></span>Name</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-3" checked><span class="toggle-switch-slider"></span>Weight</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-4" checked><span class="toggle-switch-slider"></span>Related Department ID</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-5" checked><span class="toggle-switch-slider"></span>Related Category ID</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-7" checked><span class="toggle-switch-slider"></span>Price</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-8" checked><span class="toggle-switch-slider"></span>Availability</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-9" checked><span class="toggle-switch-slider"></span>Brand</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-10" checked><span class="toggle-switch-slider"></span>Image</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-11"><span class="toggle-switch-slider"></span>Sale</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-12"><span class="toggle-switch-slider"></span>Sale Percent</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-13"><span class="toggle-switch-slider"></span>Old Price</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-17"><span class="toggle-switch-slider"></span>Created Date</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-18"><span class="toggle-switch-slider"></span>Updated Date</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-19"><span class="toggle-switch-slider"></span>Status</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-20" checked><span class="toggle-switch-slider"></span>Instruments</label></div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/product/create" class="btn btn-primary" style="position: absolute; top: 61px; z-index: 1;">Create Product</a>
                        <div class="table-responsive">
                            <table id="table1" class="display" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th class="column column-1">ID</th>
                                        <th class="column column-2">Name</th>
                                        <th class="column column-3">Weight</th>
                                        <th class="column column-4">Related Department ID</th>
                                        <th class="column column-5">Related Category ID</th>
                                        <th class="column column-7">Price</th>
                                        <th class="column column-8">Availability</th>
                                        <th class="column column-9">Brand</th>
                                        <th class="column column-10">Image</th>
                                        <th class="column column-11">Sale</th>
                                        <th class="column column-12">Sale Percent</th>
                                        <th class="column column-13">Old Price</th>
                                        <th class="column column-17">Created Date</th>
                                        <th class="column column-18">Updated Date</th>
                                        <th class="column column-19">Status</th>
                                        <th class="column column-20"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <? foreach ($productsList as $product) : ?>
                                        <tr class="table-row" data-id="product<?= $product['id'] ?>">
                                            <td class="column column-1"><?= $product['id'] ?></td>
                                            <td class="column column-2"><?= $product['name'] ?></td>
                                            <td class="column column-3"><?= $product['weight'] ?>kg</td>
                                            <td class="column column-4">#<?= $product['department_id'] ?></td>
                                            <td class="column column-5">#<?= $product['category_id'] ?></td>
                                            <td class="column column-7">$<?= $product['price'] ?></td>
                                            <td class="column column-8"><?= $product['availability'] == 1 ? 'In Stock' : 'Not Available' ?></td>
                                            <td class="column column-9"><?= $product['brand'] ?></td>
                                            <td class="column column-10"><img class="set-bg" data-setbg="<?= ProductService::getImage($product['id']) ?>" style="width: 50px; height: 50px; background-size: cover;"></td>
                                            <td class="column column-11"><?= $product['is_sale'] == 1 ? 'On Sale' : 'Not on Sale' ?></td>
                                            <td class="column column-12"><?= $product['is_sale'] == 1 ? $product['sale_percent'] : 0 ?>%</td>
                                            <td class="column column-13"><?= $product['is_sale'] == 1 ? '$' . $product['old_price'] : '-' ?></td>
                                            <td class="column column-17"><?= $product['created_at'] ?></td>
                                            <td class="column column-18"><?= $product['updated_at'] ?></td>
                                            <td class="column column-19"><?= $product['status'] == 1 ? 'Active' : 'Inactive' ?></td>
                                            <td class="column column-20">
                                                <a href="/admin/product/update/<?= $product['id'] ?>" data-id="product<?= $product['id'] ?>" class="update"><i class="mdi mdi-pencil-outline" style="font-size: 20px;"></i></a>
                                                <a href="javascript:void(0)" data-id="product<?= $product['id'] ?>" class="delete"><i class="mdi mdi-delete-variant" style="font-size: 20px;"></i></a>
                                            </td>
                                            <div class="lightbox" data-id="product<?= $product['id'] ?>">
                                                <div class="content">
                                                    <h2>Are you sure you want to delete item #<?= $product['id'] ?></h2>
                                                    <div class="btns">
                                                        <a href="javascript:void(0)" data-id="product<?= $product['id'] ?>" class="no">NO</a>
                                                        <a href="/admin/product/delete/<?= $product['id'] ?>" data-id="product<?= $product['id'] ?>" class="yes">YES</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </tr>
                                    <? endforeach; ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th class="column column-1">ID</th>
                                        <th class="column column-2">Name</th>
                                        <th class="column column-3">Weight</th>
                                        <th class="column column-4">Related Department ID</th>
                                        <th class="column column-5">Related Category ID</th>
                                        <th class="column column-7">Price</th>
                                        <th class="column column-8">Availability</th>
                                        <th class="column column-9">Brand</th>
                                        <th class="column column-10">Image</th>
                                        <th class="column column-11">Sale</th>
                                        <th class="column column-12">Sale Percent</th>
                                        <th class="column column-13">Old Price</th>
                                        <th class="column column-17">Created Date</th>
                                        <th class="column column-18">Updated Date</th>
                                        <th class="column column-19">Status</th>
                                        <th class="column column-20"></th>
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