<?php

class AdminController extends AdminBase
{

    public function actionIndex()
    {
        require_once(ROOT . '/view/admin/index.php');
        return true;
    }
}
