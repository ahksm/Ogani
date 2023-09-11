<?php

class UserRepository
{
    public function register(User $user)
    {
        $db = Db::getConnection();

        $hashedPassword = password_hash($user->password, PASSWORD_ARGON2ID);

        $sql = 'INSERT INTO users (username, first_name, last_name, country, city, street_address, apartment_address, zip, phone, email, password) '
            . 'VALUES (:username, :first_name, :last_name, :country, :city, :street_address, :apartment_address, :zip, :phone, :email, :password)';

        $result = $db->prepare($sql);
        $result->bindParam(':username', $user->username, PDO::PARAM_STR);
        $result->bindParam(':first_name', $user->firstName, PDO::PARAM_STR);
        $result->bindParam(':last_name', $user->lastName, PDO::PARAM_STR);
        $result->bindParam(':country', $user->country, PDO::PARAM_STR);
        $result->bindParam(':city', $user->city, PDO::PARAM_STR);
        $result->bindParam(':street_address', $user->streetAddress, PDO::PARAM_STR);
        $result->bindParam(':apartment_address', $user->apartmentAddress, PDO::PARAM_STR);
        $result->bindParam(':zip', $user->zip, PDO::PARAM_STR);
        $result->bindParam(':phone', $user->phone, PDO::PARAM_STR);
        $result->bindParam(':email', $user->email, PDO::PARAM_STR);
        $result->bindParam(':password', $hashedPassword, PDO::PARAM_STR);

        return $result->execute() ? $db->lastInsertId() : false;
    }

    public function update(User $user)
    {
        $db = Db::getConnection();

        $hashedPassword = password_hash($user->password, PASSWORD_ARGON2ID);

        $sql = "UPDATE users 
            SET username = :username, country = :country, city = :city, street_address = :street_address, apartment_address = :apartment_address, zip = :zip, password = :password 
            WHERE id = :id";

        $result = $db->prepare($sql);
        $result->bindParam(':id', $user->id, PDO::PARAM_INT);
        $result->bindParam(':username', $user->username, PDO::PARAM_STR);
        $result->bindParam(':country', $user->country, PDO::PARAM_STR);
        $result->bindParam(':city', $user->city, PDO::PARAM_STR);
        $result->bindParam(':street_address', $user->streetAddress, PDO::PARAM_STR);
        $result->bindParam(':apartment_address', $user->apartmentAddress, PDO::PARAM_STR);
        $result->bindParam(':zip', $user->zip, PDO::PARAM_STR);
        $result->bindParam(':password', $hashedPassword, PDO::PARAM_STR);

        return $result->execute() ? $db->lastInsertId() : false;
    }

    public function login(User $user)
    {
        $db = Db::getConnection();

        $sql = 'SELECT * FROM users WHERE email = :email';

        $result = $db->prepare($sql);
        $result->bindParam(':email', $user->email, PDO::PARAM_STR);
        $result->execute();

        $dbUser = $result->fetch();

        if ($dbUser !== false and password_verify($user->password, $dbUser['password'])) {
            return $dbUser['id'];
        }
        return false;
    }

    public static function getUserById($id)
    {
        $db = Db::getConnection();

        $sql = 'SELECT * FROM users WHERE id = :id';

        $result = $db->prepare($sql);
        $result->bindParam(':id', $id, PDO::PARAM_INT);

        $result->setFetchMode(PDO::FETCH_ASSOC);
        $result->execute();

        $data = $result->fetch();

        $camelCaseData = array_map(function ($key) {
            return lcfirst(str_replace('_', '', ucwords($key, '_')));
        }, array_keys($data));
    
        return array_combine($camelCaseData, $data);
    }
}
