<?php include_once ROOT . '/view/layouts/header.php' ?>

<div class="form-validation">
    <form class="form-validate" action="" method="POST">
        <div class="d-flex justify-content-center col-lg-12">
            <div class="form-row row">
                <?php if (isset($userId)) : ?>
                    <h1 class="col-xl-12 text-center mb-3">You have edited successfully!</h1>
                    <div class="form-group">
                        <a href="/" type="submit" class="btn btn-primary">HOME PAGE</a>
                    </div>
                <?php else : ?>
                    <h1 class="col-xl-12 text-center mb-3">Edit <?= $user['username'] ?> profile</h1>
                    <div class="col-xl-6">
                        <?php
                        $fields = [
                            'username' => ['label' => 'Username'],
                            'country' => ['label' => 'Country'],
                            'city' => ['label' => 'Town/City'],
                            'streetAddress' => ['label' => 'Street Address'],
                        ];

                        foreach ($fields as $fieldName => $fieldInfo) {
                            $label = $fieldInfo['label'];
                            $value = $user[$fieldName] ?? '';
                            include(ROOT . '/view/components/input.php');
                        }
                        ?>
                    </div>
                    <div class="col-xl-6">
                        <?php
                        $fields = [
                            'apartmentAddress' => ['label' => 'Apartment Address'],
                            'zip' => ['label' => 'Postcode/ZIP'],
                            'password' => ['label' => 'Password', 'type' => 'password'],
                            'confirmPassword' => ['label' => 'Confirm Password', 'type' => 'password'],
                        ];

                        foreach ($fields as $fieldName => $fieldInfo) {
                            $label = $fieldInfo['label'];
                            $inputType = ($fieldInfo['type'] ?? 'text') === 'text' ? 'text' : $fieldInfo['type'];
                            $value = $user[$fieldName] ?? '';
                            include(ROOT . '/view/components/input.php');
                        }
                        ?>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                    </div>
                <?php endif ?>
            </div>
        </div>
    </form>
</div>

<?php include_once ROOT . '/view/layouts/footer.php' ?>