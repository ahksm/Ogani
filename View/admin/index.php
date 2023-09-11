<?php include ROOT . '/view/layouts/header-admin.php'; ?>

<div class="content-body">
    <div class="container-fluid" style="height: 800px;">
        <div class="row page-titles mx-0" style="height: 800px;">
            <div class="col-sm-12 p-md-0 d-flex justify-content-center align-items-center">
                <div class="welcome-text">
                    <h4 style="font-size: 50px;">Hi, welcome back!</h4>
                    <span class="ml-1" style="font-size: 40px;"><?= $this->user['username'] ?></span>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include ROOT . '/view/layouts/footer-admin.php'; ?>