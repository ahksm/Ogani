<?php include_once ROOT . '/view/layouts/header.php' ?>

<div class="form-validation">
    <form class="form-validate" action="" method="POST">
        <div class="d-flex justify-content-center col-lg-12">
            <div class="form-row row">
                <h1 class="col-xl-12 text-center mb-3">Login</h1>

                <?php
                $fields = [
                    'email' => ['label' => 'Email', 'type' => 'email'],
                    'password' => ['label' => 'Password', 'type' => 'password'],
                ];

                foreach ($fields as $fieldName => $fieldInfo) {
                    $label = $fieldInfo['label'];
                    $inputType = $fieldInfo['type'];
                    $value = $user->fieldName ?? '';
                    include(ROOT . '/view/components/input.php');
                }
                ?>

                <p class="login">Not Registered yet? Then <a href="/login">click here.</a></p>
                <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </div>
    </form>
</div>

<?php include_once ROOT . '/view/layouts/footer.php' ?>