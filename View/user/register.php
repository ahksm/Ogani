<?php include_once ROOT . '/view/layouts/header.php' ?>

<div class="form-validation">
    <form class="form-validate" action="" method="POST">
        <div class="d-flex justify-content-center col-lg-12">
            <div class="form-row row">
                <h1 class="col-xl-12 text-center mb-3">Registration</h1>
                <div class="col-xl-6">
                    <?php
                    $fields = [
                        'username' => ['label' => 'Username'],
                        'firstName' => ['label' => 'First Name'],
                        'lastName' => ['label' => 'Last Name'],
                        'country' => ['label' => 'Country'],
                        'city' => ['label' => 'Town/City'],
                        'streetAddress' => ['label' => 'Street Address'],
                    ];

                    foreach ($fields as $fieldName => $fieldInfo) {
                        $label = $fieldInfo['label'];
                        $inputType = ($fieldInfo['type'] ?? 'text') === 'text' ? 'text' : 'text';
                        $value = isset($user->{$fieldName}) ? $user->{$fieldName} : '';
                        include(ROOT . '/view/components/input.php');
                    }
                    ?>
                </div>
                <div class="col-xl-6">
                    <?php
                    $fields = [
                        'apartmentAddress' => ['label' => 'Apartment Address'],
                        'zip' => ['label' => 'Postcode/ZIP'],
                        'phone' => ['label' => 'Phone Number'],
                        'email' => ['label' => 'Email', 'type' => 'email'],
                        'password' => ['label' => 'Password', 'type' => 'password'],
                        'confirmPassword' => ['label' => 'Confirm Password', 'type' => 'password'],
                    ];

                    foreach ($fields as $fieldName => $fieldInfo) {
                        $label = $fieldInfo['label'];
                        $inputType = ($fieldInfo['type'] ?? 'text') === 'text' ? 'text' : $fieldInfo['type'];
                        $value = isset($user->{$fieldName}) ? $user->{$fieldName} : '';
                        include(ROOT . '/view/components/input.php');
                    }
                    ?>
                </div>
                <p class="login">Already Registered? Then <a href="/login">login.</a></p>
                <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </form>
</div>

<?php include_once ROOT . '/view/layouts/footer.php' ?>