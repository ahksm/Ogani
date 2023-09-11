<?php

class UserController extends BaseController
{
    private $userService;

    public function __construct()
    {
        $this->userService = new UserService(new UserRepository);
    }

    public function actionRegister()
    {
        if (isset($_POST['submit'])) {
            $user = User::request($_POST);
            $errors = $this->userService->validateRegister($user);
            header("Location: /");
            $userId = !$errors ? $this->userService->register($user) : false;
        }

        require_once(ROOT . '/view/user/register.php');
        return true;
    }

    public function actionUpdate()
    {
        $user = UserRepository::getUserById(UserService::checkLogged());

        if (isset($_POST['submit'])) {
            $_POST['id'] = $user['id'];
            $user = User::request($_POST);
            $errors = $this->userService->validateUpdate($user);
            $userId = !$errors ? $this->userService->update($user) : false;
        }

        require_once(ROOT . '/view/user/update.php');
        return true;
    }

    public function actionLogin()
    {
        if (isset($_POST['submit'])) {
            $user = User::request($_POST);
            $errors = $this->userService->validateLogin($user);
            $userId = !$errors ? $this->userService->login($user) : false;
        }

        require_once(ROOT . '/view/user/login.php');

        return true;
    }

    public function actionLogout()
    {
        session_start();

        unset($_SESSION["user"]);

        header("Location: /");
    }
}
