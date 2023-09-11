<?php

class UserService
{
    private $repository;

    public function __construct(UserRepository $repository)
    {
        $this->repository = $repository;
    }

    public function validate(User $user, $rules)
    {
        $errors = [];

        foreach ($rules as $field => $rule) {
            $result = Validator::validate($field, $user->{$field}, $rule);
            if (!$result['valid']) {
                $errors[$field] = $result['message'];
            }
        }

        return $errors ?: null;
    }

    public function validateRegister(User $user)
    {
        $rules = [
            'username' => 'required|min:2',
            'firstName' => 'required|min:2',
            'lastName' => 'required|min:2',
            'country' => 'required|min:2',
            'city' => 'required|min:2',
            'streetAddress' => 'required|min:2',
            'apartmentAddress' => 'required',
            'zip' => 'required|min:5|numeric',
            'phone' => 'required|numeric',
            'email' => 'required|email|unique',
            'password' => 'required|min:6',
            'confirmPassword' => 'same:password',
        ];

        return $this->validate($user, $rules);
    }

    public function validateUpdate(User $user)
    {
        $rules = [
            'username' => 'required|min:2',
            'country' => 'required|min:2',
            'city' => 'required|min:2',
            'streetAddress' => 'required|min:2',
            'apartmentAddress' => 'required',
            'zip' => 'required|min:5|numeric',
        ];

        if (!empty($user->password)) {
            $rules['password'] = 'required|min:6';
            $rules['confirmPassword'] = 'same:password';
        }

        return $this->validate($user, $rules);
    }

    public function validateLogin(User $user)
    {
        $rules = [
            'email' => 'required|email|unique_email_password',
            'password' => 'required|min:6',
        ];

        return $this->validate($user, $rules);
    }

    public function register(User $user)
    {
        $userId = $this->repository->register($user);
        if ($userId) {
            self::auth($userId);
            return $userId;
        }
    }

    public function update(User $user)
    {
        return $this->repository->update($user);
    }

    public function login(User $user)
    {
        $userId = $this->repository->login($user);
        if ($userId) {
            self::auth($userId);
            header("Location: /");
        }
    }

    public static function auth($userId)
    {
        $_SESSION['user'] = $userId;
    }

    public static function checkLogged()
    {
        if (isset($_SESSION['user'])) {
            return $_SESSION['user'];
        }

        header("Location: /login");
    }

    public static function isGuest()
    {
        return !isset($_SESSION['user']);
    }
}
