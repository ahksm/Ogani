<?php include ROOT . '/view/layouts/header-admin.php'; ?>

<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Update Product#<?= $product['id'] ?></h4>
                    </div>
                    <div class="card-body">
                        <div class="form-validation">
                            <span class="text-danger"><?php if (isset($errors) && is_array($errors)) foreach ($errors as $error) echo $error ?></span>
                            <form class="form-validate" action="" method="POST" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <?php
                                        $fields = [
                                            'name' => ['label' => 'Product Name'],
                                            'weight' => ['label' => 'Weight'],
                                            'price' => ['label' => 'Price'],
                                            'brand' => ['label' => 'Brand Name'],
                                            'color' => ['label' => 'Color', 'selectOptions' => true, 'options' => [
                                                'white' => 'White',
                                                'red' => 'Red',
                                                'blue' => 'Blue',
                                                'yellow' => 'Yellow',
                                                'black' => 'Black',
                                                'green' => 'Green',
                                            ]],
                                            'size' => ['label' => 'Size', 'selectOptions' => true, 'options' => [
                                                'large' => 'Large',
                                                'medium' => 'Medium',
                                                'small' => 'Small',
                                                'tiny' => 'Tiny',
                                            ]],
                                            'department_id' => [
                                                'label' => 'Related Department',
                                                'selectEntity' => true,
                                                'options' => $this->departments
                                            ],
                                            'category_id' => [
                                                'label' => 'Related Category',
                                                'selectEntity' => true,
                                                'options' => $this->categories
                                            ],
                                            'availability' => [
                                                'label' => 'Availability',
                                                'selectOptions' => true,
                                                'options' => [
                                                    '1' => 'In Stock',
                                                    '0' => 'Not Available',
                                                ],
                                            ],
                                            'image' => ['label' => 'Image', 'type' => 'file'],
                                            'is_sale' => ['label' => 'On Sale?', 'selectOptions' => true, 'options' => [
                                                '1' => 'Yes',
                                                '0' => 'No',
                                            ]],
                                            'sale_percent' => ['label' => 'Sale Percent'],
                                            'old_price' => ['label' => 'Old Price'],
                                            'status' => [
                                                'label' => 'Status',
                                                'selectOptions' => true,
                                                'options' => [
                                                    '1' => 'Active',
                                                    '0' => 'Inactive',
                                                ],
                                            ],
                                            'short_descr' => ['label' => 'Short Description', 'textarea' => true],
                                            'long_descr' => ['label' => 'Long Description', 'textarea' => true],
                                            'info' => ['label' => 'Other Information', 'textarea' => true],
                                            'review' => ['label' => 'Review', 'textarea' => true],
                                        ];

                                        foreach ($fields as $fieldName => $fieldInfo) {
                                            $label = $fieldInfo['label'];
                                            $textarea = $fieldInfo['textarea'] ?? false;
                                            $selectEntity = $fieldInfo['selectEntity'] ?? false;
                                            $selectOptions = $fieldInfo['selectOptions'] ?? false;
                                            $options = $fieldInfo['options'] ?? [];
                                            $inputType = ($fieldInfo['type'] ?? 'text') === 'text' ? 'text' : $fieldInfo['type'];
                                            $value = isset($product[$fieldName]) ? $product[$fieldName] : (isset($options[$fieldName]) ? $options[$fieldName] : '');
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