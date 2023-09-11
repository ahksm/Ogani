<?php

class CategoryRepository
{
    private static function executeQuery($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        $result->setFetchMode(PDO::FETCH_ASSOC);
        $result->execute($params);
        return $result->fetchAll();
    }

    private static function executeIntQuery($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        foreach ($params as $key => $value) {
            $result->bindValue($key, $value, is_int($value) ? PDO::PARAM_INT : PDO::PARAM_STR);
        }
        $result->execute();
        return $result->fetchAll(PDO::FETCH_ASSOC);
    }

    private static function executeDelete($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        return $result->execute($params);
    }

    private static function executeUpdate($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        return $result->execute($params);
    }

    private static function executeInsert($sql, $params = [])
    {
        $db = Db::getConnection();
        $result = $db->prepare($sql);
        if ($result->execute($params)) {
            return $db->lastInsertId();
        }
        return 0;
    }

    public static function getCatList($admin = false)
    {
        $sql = 'SELECT * FROM categories';
        $params = [];

        if (!$admin) {
            $sql .= ' WHERE status = :status';
            $params[':status'] = Category::ACTIVE;
        }

        $sql .= ' ORDER BY sort_order, name ASC';

        return self::executeQuery($sql, $params);
    }

    public static function getDeptList($admin = false)
    {
        $sql = 'SELECT * FROM departments';
        $params = [];

        if (!$admin) {
            $sql .= ' WHERE status = :status';
            $params[':status'] = Department::ACTIVE;
        }

        $sql .= ' ORDER BY sort_order';

        return self::executeQuery($sql, $params);
    }

    public static function getCategoryById($id)
    {
        $sql = 'SELECT * FROM categories WHERE id = :id';
        $params = [':id' => $id];

        return self::executeQuery($sql, $params);
    }

    public static function getDepartmentById($id)
    {
        $sql = 'SELECT * FROM departments WHERE id = :id';
        $params = [':id' => $id];

        return self::executeQuery($sql, $params);
    }

    public static function getDeptListByCategory($categoryId)
    {
        $sql = 'SELECT id, name, category_id FROM departments WHERE category_id = :category_id ORDER BY sort_order';
        $params = [':category_id' => $categoryId];

        return self::executeQuery($sql, $params);
    }

    public static function createCat($category)
    {
        $sql = 'INSERT INTO categories (name, sort_order, status) VALUES (:name, :sort_order, :status)';
        $params = [':name' => $category->name, ':sort_order' => $category->sort_order, ':status' => $category->status];

        return self::executeInsert($sql, $params);
    }

    public static function createDept($department)
    {
        $sql = 'INSERT INTO departments (name, sort_order, status, category_id) VALUES (:name, :sort_order, :status, :category_id)';
        $params = [
            ':name' => $department->name,
            ':sort_order' => $department->sort_order,
            ':status' => $department->status,
            ':category_id' => $department->category_id,
        ];

        return self::executeInsert($sql, $params);
    }

    public static function updateCat($id, $category)
    {
        $sql = "UPDATE categories SET name = :name, sort_order = :sort_order, status = :status, updated_at = now() WHERE id = :id";
        $params = [':id' => $id, ':name' => $category->name, ':sort_order' => $category->sort_order, ':status' => $category->status];

        return self::executeUpdate($sql, $params);
    }

    public static function updateDept($id, $department)
    {
        $sql = "UPDATE departments SET name = :name, sort_order = :sort_order, category_id = :category_id, status = :status, updated_at = now() WHERE id = :id";
        $params = [
            ':id' => $id,
            ':name' => $department->name,
            ':sort_order' => $department->sort_order,
            ':category_id' => $department->category_id,
            ':status' => $department->status,
        ];

        return self::executeUpdate($sql, $params);
    }

    public static function deleteCat($id)
    {
        $sql = 'DELETE FROM categories WHERE id = :id';
        $params = [':id' => $id];

        return self::executeDelete($sql, $params);
    }

    public static function deleteDept($id)
    {
        $sql = 'DELETE FROM departments WHERE id = :id';
        $params = [':id' => $id];

        return self::executeDelete($sql, $params);
    }
}
