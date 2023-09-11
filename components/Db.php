<?php

class Db
{

    /**
     * Gets connection to database
     * @return \PDO <p>Object with class of PDO for work with DB</p>
     */
    public static function getConnection()
    {
        $paramsPath = './config/db_params.php';
        $params = include($paramsPath);

        $dsn = "mysql:host={$params['host']};dbname={$params['dbname']}";
        $db = new PDO($dsn, $params['user'], $params['password']);

        $db->exec("set names utf8");

        return $db;
    }

}