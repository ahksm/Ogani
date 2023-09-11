<?php

abstract class AdminBase
{
    protected $departments;
    protected $categories;
    protected $user;

    public function __construct()
    {
        $this->checkAdmin();
        $this->departments = CategoryRepository::getDeptList(true);
        $this->categories = CategoryRepository::getCatList(true);
        $this->user = UserRepository::getUserById(UserService::checkLogged());
    }

    public static function checkAdmin()
    {
        $userId = UserService::checkLogged();

        $user = UserRepository::getUserById($userId);

        if ($user['role'] == 'admin') {
            return true;
        }

        die('Access denied');
    }
}
