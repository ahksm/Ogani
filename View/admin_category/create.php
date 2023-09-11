<?php include ROOT . '/view/layouts/header-admin.php'; ?>

<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Create Category</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-validation">
                            <span class="text-danger"><? if (isset($errors) && is_array($errors)) foreach ($errors as $error) echo $error ?></span>
                            <form class="form-validate" action="" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <?php
                                            $fields = [
                                                'name' => ['label' => 'Category Name'],
                                                'sort_order' => ['label' => 'Sort Order'],
                                                'image' => ['label' => 'Image', 'type' => 'file'],
                                                'status' => [
                                                    'label' => 'Status',
                                                    'selectOptions' => true,
                                                    'options' => [
                                                        '1' => 'Active',
                                                        '0' => 'Inactive',
                                                    ],
                                                ],
                                            ];

                                            foreach ($fields as $fieldName => $fieldInfo) {
                                                $label = $fieldInfo['label'];
                                                $textarea = $fieldInfo['textarea'] ?? false;
                                                $selectEntity = $fieldInfo['selectEntity'] ?? false;
                                                $selectOptions = $fieldInfo['selectOptions'] ?? false;
                                                $options = $fieldInfo['options'] ?? [];
                                                $inputType = ($fieldInfo['type'] ?? 'text') === 'text' ? 'text' : $fieldInfo['type'];
                                                $value = isset($category->{$fieldName}) ? $category->{$fieldName} : (isset($options[$fieldName]) ? $options[$fieldName] : '');
                                                include(ROOT . '/view/components/input-admin.php');
                                            }
                                        ?>
                                        <div class="form-group row">
                                            <div class="col-lg-12 ml-auto">
                                                <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include ROOT . '/view/layouts/footer-admin.php'; ?>