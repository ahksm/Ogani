<?php include ROOT . '/view/layouts/header-admin.php'; ?>
<div class="content-body">
    <div class="container-fluid">
        <!-- row -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Departments datatable</h4>
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
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-3" checked><span class="toggle-switch-slider"></span>Related Category</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-4" checked><span class="toggle-switch-slider"></span>Sort Order</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-5" checked><span class="toggle-switch-slider"></span>Created Date</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-6" checked><span class="toggle-switch-slider"></span>Updated Date</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-7" checked><span class="toggle-switch-slider"></span>Status</label></div>
                                    <div class="dropdown-item"><label class="toggle-switch"><input type="checkbox" value="column-8" checked><span class="toggle-switch-slider"></span>Instruments</label></div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/department/create" class="btn btn-primary" style="position: absolute; top: 61px; z-index: 1;">Create Departmnent</a>
                        <div class="table-responsive">
                            <table id="table1" class="display" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th class="column column-1">ID</th>
                                        <th class="column column-2">Name</th>
                                        <th class="column column-3">Related Category</th>
                                        <th class="column column-4">Sort Order</th>
                                        <th class="column column-5">Created Date</th>
                                        <th class="column column-6">Updated Date</th>
                                        <th class="column column-7">Status</th>
                                        <th class="column column-8"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <? foreach ($departments as $department) : ?>
                                        <tr class="table-row" data-id="department<?= $department['id'] ?>">
                                            <td class="column column-1"><?= $department['id'] ?></td>
                                            <td class="column column-2"><?= $department['name'] ?></td>
                                            <td class="column column-3">#<?= $department['category_id'] ?></td>
                                            <td class="column column-4"><?= $department['sort_order'] ?></td>
                                            <td class="column column-5"><?= $department['created_at'] ?></td>
                                            <td class="column column-6"><?= $department['updated_at'] ?></td>
                                            <td class="column column-7"><?= $department['status'] == 1 ? 'Active' : 'Inactive' ?></td>
                                            <td class="column column-8">
                                                <a href="/admin/department/update/<?= $department['id'] ?>" data-id="department<?= $department['id'] ?>" class="update"><i class="mdi mdi-pencil-outline" style="font-size: 20px;"></i></a>
                                                <a href="javascript:void(0)" data-id="department<?= $department['id'] ?>" class="delete"><i class="mdi mdi-delete-variant" style="font-size: 20px;"></i></a>
                                            </td>
                                            <div class="lightbox" data-id="department<?= $department['id'] ?>">
                                                <div class="content">
                                                    <h2>Are you sure you want to delete item #<?= $department['id'] ?></h2>
                                                    <div class="btns">
                                                        <a href="javascript:void(0)" data-id="department<?= $department['id'] ?>" class="no">NO</a>
                                                        <a href="/admin/department/delete/<?= $department['id'] ?>" data-id="department<?= $department['id'] ?>" class="yes">YES</a>
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
                                        <th class="column column-3">Related Category</th>
                                        <th class="column column-4">Sort Order</th>
                                        <th class="column column-5">Created Date</th>
                                        <th class="column column-6">Updated Date</th>
                                        <th class="column column-7">Status</th>
                                        <th class="column column-8"></th>
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