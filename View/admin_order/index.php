<?php include ROOT . '/view/layouts/header-admin.php'; ?>
<div class="content-body">
    <div class="container-fluid">
        <!-- row -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Orders</h4>
                    </div>
                    <div class="card-body">
                        <div class="dropdown special">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Column Selector
                            </button>
                            <div class="dropdown-menu special" aria-labelledby="dropdownMenuButton">
                                <div id="column-selector" class="d-flex flex-column">
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-1" checked><span class="toggle-switch-slider"></span>ID</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-2" checked><span class="toggle-switch-slider"></span>User ID</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-3" checked><span class="toggle-switch-slider"></span>User Name</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-4" checked><span class="toggle-switch-slider"></span>User Phone</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-5" checked><span class="toggle-switch-slider"></span>Comments</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-6" checked><span class="toggle-switch-slider"></span>Date of Order</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-7" checked><span class="toggle-switch-slider"></span>Date of Updated</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-8" checked><span class="toggle-switch-slider"></span>Status</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-9" checked><span class="toggle-switch-slider"></span>Instruments</label></div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table id="table1" class="display" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th class="column column-1">ID</th>
                                        <th class="column column-2">User ID</th>
                                        <th class="column column-3">User Name</th>
                                        <th class="column column-4">User Phone</th>
                                        <th class="column column-5">Comments</th>
                                        <th class="column column-6">Date of Order</th>
                                        <th class="column column-8">Status</th>
                                        <th class="column column-9"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <? foreach ($ordersList as $order) : ?>
                                        <tr class="table-row" data-id="order<?= $order['id'] ?>">
                                            <td class="column column-1"><?= $order['id'] ?></td>
                                            <td class="column column-2">#<?= $order['user_id'] ?></td>
                                            <td class="column column-5"><?= $order['user_comment'] ?></td>
                                            <td class="column column-6"><?= $order['created_at'] ?></td>
                                            <td class="column column-8"><?= $order['status'] == 1 ? 'Active' : 'Inactive' ?></td>
                                            <td class="column column-9">
                                                <a href="/admin/order/view/<?= $order['id'] ?>" data-id="order<?= $order['id'] ?>" class="view"><i class="mdi mdi-eye-arrow-left-outline"></i></a>
                                                <a href="javascript:void(0)" data-id="order<?= $order['id'] ?>" class="delete"><i class="mdi mdi-delete-variant" style="font-size: 20px;"></i></a>
                                            </td>
                                            <div class="lightbox" data-id="order<?= $order['id'] ?>">
                                                <div class="content">
                                                    <h2>Are you sure you want to delete item #<?= $order['id'] ?></h2>
                                                    <div class="btns">
                                                        <a href="javascript:void(0)" data-id="order<?= $order['id'] ?>" class="no">NO</a>
                                                        <a href="/admin/order/delete/<?= $order['id'] ?>" data-id="order<?= $order['id'] ?>" class="yes">YES</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </tr>
                                    <? endforeach; ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th class="column column-1">ID</th>
                                        <th class="column column-2">User ID</th>
                                        <th class="column column-3">User Name</th>
                                        <th class="column column-4">User Phone</th>
                                        <th class="column column-5">User Comments</th>
                                        <th class="column column-6">Date of Order</th>
                                        <th class="column column-8">Status</th>
                                        <th class="column column-9"></th>
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