<?php

class User
{
    public $id;
    public $username;
    public $firstName;
    public $lastName;
    public $country;
    public $city;
    public $streetAddress;
    public $apartmentAddress;
    public $zip;
    public $phone;
    public $email;
    public $password;
    public $confirmPassword;

    public static function request($data)
    {
        $user = new User();
        foreach ($data as $key => $value) {
            $user->{$key} = $value;
        }
        return $user;
    }
}
